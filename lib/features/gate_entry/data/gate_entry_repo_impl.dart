import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/consts/doctypes.dart';
import 'package:aparna_pod/core/core.dart';

import 'package:aparna_pod/features/gate_entry/data/gate_entry_repo.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_form.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:aparna_pod/features/gate_entry/model/material_name_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GateEntryRepo)
class GateEntryRepoImpl extends BaseApiRepository implements GateEntryRepo {
  const GateEntryRepoImpl(super.client);

  @override
  AsyncValueOf<List<GateEntryForm>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => GateEntryForm.fromJson(e)).toList();
      },
      reqParams: {
        if (!(docStatus == null)) ...{
          'filters': [
            ["docstatus", "=", docStatus],
            if (search.containsValidValue) ...{
              ["name", "Like", "%$search%"]
            }
          ],
        },
        'limit_start': start,
        'limit': 20,
        'order_by': 'creation DESC',
        'doctype': 'Gate Entry',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    $logger.devLog(response);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<GateEntryLinesForm>> fetchEntriesLines(
      String itemName) async {
    final requestConfig = RequestConfig(
      url: '${Urls.defaultGateEntry}/$itemName',
      parser: (json) {
        final data = json['data']['gate_entry_lines'];
        final listdata = data as List<dynamic>;
        return listdata.map((e) => GateEntryLinesForm.fromJson(e)).toList();
      },
      reqParams: {
        'limit': 20,
        'order_by': 'name DESC',
        'doctype': 'Gate Entry Lines',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<MaterialNameForm>> materialName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.item,
        reqParams: {
          'fields': MaterialNameForm.fields,
          'limit_page_length': 'None'
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => MaterialNameForm.fromJson(e)).toList();
        },
      );

      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> updateGateEntry(
      GateEntryForm form, List<GateEntryLinesForm> lines) async {
    final formData = form.toJson();
    formData
      ..remove('name')
      ..remove('creation')
      ..remove('gate_entry_date')
      ..remove('weighment_date');
    final reqMap = lines
      ..where((element) => element.name == null)
      ..map((e) => removeNullValues(e.toJson())).toList();
    final requestConfig = RequestConfig(
      url: Urls.updateGateEntry,
      body: jsonEncode(removeNullValues({
        'ge_id': form.name,
        'gate_entry_lines': reqMap,
        ...formData,
      })),
      parser: (json) {
        final data = json['message']['message'];
        return data;
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createGateEntry(
      GateEntryForm form, List<GateEntryLinesForm> lines) async {
    final formJson = form.toJson();

    formJson.update('status', (value) => 'Draft');
    final files = {
      'drivers_license_photo': form.licensePhotoImg,
      'vehicle_image': form.vehiclePhotoImg,
      'seal_photo': form.sealPhotoImg,
      'breath_analyser': form.breathAnalyserImg,
      'invoicedc_image_ocr_scanning': form.invoiceImg.firstOrNull,
    };
    final addFiles = <File>[];
    for (int i = 1; i < form.invoiceImg.length; i++) {
      addFiles.add(form.invoiceImg.elementAt(i));
    }
    files.removeWhere((key, value) => value == null);
    final responseurlMap = <String, dynamic>{};
    final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
    final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
    for (final file in files.keys) {
      final indx = files.keys.toList().indexOf(file);
      responseurlMap[file] = urls.elementAtOrNull(indx);
    }
    final finalMap = {...removeNullValues(form.toJson()), ...responseurlMap};

    final requestConfig = RequestConfig(
      url: Urls.createGateEntry,
      body: jsonEncode(finalMap),
      parser: (json) {
        final data = json['message']['message'] as String;
        final docNo = json['message']['data'] as String;
        return Pair(data, docNo);
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await post(requestConfig);
    return response.processAsync((r) async {
      await updateGateEntry(form.copyWith(name: r.data!.second), lines);
      if (addFiles.isNotEmpty) {
        await _uploadAddfiles(addFiles, r.data!.second);
      }
      return right(Pair(r.data!.first, r.data!.second));
    });
  }

  @override
  AsyncValueOf<Pair<String, String>> submitGateEntry(
      GateEntryForm form, List<GateEntryLinesForm> lines) async {
    return await executeSafely(() async {
      final unsavedLines = lines.where((e) => e.name.doesNotHaveValue);
      await updateGateEntry(
          form.copyWith(name: form.name), unsavedLines.toList());
      final files = {
        'drivers_license_photo': form.licensePhotoImg,
        'vehicle_image': form.vehiclePhotoImg,
        'seal_photo': form.sealPhotoImg,
        'breath_analyser': form.breathAnalyserImg,
        'invoicedc_image_ocr_scanning': form.invoiceImg.firstOrNull,
      };
      files.removeWhere((key, value) => value == null);
      final responseurlMap = <String, dynamic>{};
      final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      for (final file in files.keys) {
        final indx = files.keys.toList().indexOf(file);
        responseurlMap[file] = urls.elementAtOrNull(indx);
      }
      final addFiles = <File>[];
      if (form.invoiceImg.length > 1) {
        for (int i = 1; i < form.invoiceImg.length; i++) {
          addFiles.add(form.invoiceImg.elementAt(i));
        }
      }
      await _uploadAddfiles(addFiles, form.name!);

      final finalMap = {
        ...removeNullValues(form.toJson()),
        ...responseurlMap,
      };
      if(form.deletedLines.isNotEmpty){
     await deleteLines(form.name!,form.deletedLines);

      }
      final reqBody = finalMap..remove('status');
      final config = RequestConfig(
          url: Urls.submitGateEntry,
          parser: (json) {
            final data = json['message']['message'] as String;
            return Pair(data, '');
          },
          body: jsonEncode({"gate_entry_id": form.name, ...reqBody}));

      final response = await post(config);
      return response.process((r) {
        return right(Pair(r.data!.first, ''));
      });
    });
  }

  AsyncValueOf<List<String>> _uploadfiles(List<File> files) async {
    return await executeSafely(() async {
      if (files.isEmpty) return right(<String>[]);
      final config = RequestConfig(
        url: Urls.uploadFiles,
        parser: (p0) {
          final msgList = p0['message']['uploaded_files_data'] as List<dynamic>;
          final urls = msgList.map((e) => e['file_url'].toString()).toList();
          return urls;
        },
        reqParams: {'file': files},
      );
      final response = await multiPart(config);
      return response.process((r) => right(r.data!));
    });
  }

  AsyncValueOf<List<String>> _uploadAddfiles(
      List<File> files, String name) async {
    return await executeSafely(() async {
      if (files.isEmpty) return right(<String>[]);
      final config = RequestConfig(
        url: Urls.uploadFiles,
        parser: (p0) {
          final msgList = p0['message']['uploaded_files_data'] as List<dynamic>;
          final urls = msgList.map((e) => e['file_url'].toString()).toList();
          return urls;
        },
        reqParams: {
          'file': files,
          'attached_to_doctype': DocTypes.gateEntryList,
          'attached_to_field': 'invoicedc_image_ocr_scanning',
          'attached_to_name': name,
        },
      );
      final response = await multiPart(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<SupplierNameForm>> supplierName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.supplierName,
        reqParams: {
          'fields': ['*'],
          'limit_page_length': 'None'
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => SupplierNameForm.fromJson(e)).toList();
        },
      );

      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<String>> fetchAttachments(String id) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          "doctype": "File",
          "filters": [
            ["file_name", "LIKE", "%Inv%"],
            ["attached_to_name", "LIKE", id]
          ],
          "fields": ["file_url"]
        },
        parser: (p0) {
          final data = p0['message'] as List<dynamic>;
          return data.map((e) => e['file_url'].toString()).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  AsyncValueOf<String> deleteLines(String id, List<String> lines) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.deleteLines,
        parser: (json) => json,
        body: jsonEncode({
           "doctype": "Gate Entry", 
          "ge_id": id, 
          "lines": lines}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'

        });
       
      
      final response = await post(config);

      return response.process((r) => right('Successfully Deleted'));
    });
  }
}
