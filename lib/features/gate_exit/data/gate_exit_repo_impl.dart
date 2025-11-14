import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/consts/doctypes.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_lines_form.dart';

import 'package:aparna_pod/features/gate_exit/data/gate_exit_repo.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_address_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GateExitRepo)
class GateExitRepoImpl extends BaseApiRepository implements GateExitRepo {
  const GateExitRepoImpl(super.client);

  @override
  AsyncValueOf<List<GateExitForm>> fetchExits(
    int start,
    int? docStatus,
    String? search,
  ) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'];

          final listdata = data as List<dynamic>;
          return listdata.map((e) => GateExitForm.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            if (search.containsValidValue) ["name", "Like", "%$search%"],
            if (docStatus != null) ["docstatus", "=", docStatus],
          ],
          'limit_start': start,
          'limit': 20,
          'doctype': 'Gate Exit',
          'order_by': 'creation DESC',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> updateGateExit(
      GateExitForm form, List<GateEntryLinesForm> lines) async {
    return await executeSafely(() async {
      final formData = removeNullValues(form.toJson());
      const keysToRemove = [
        'name',
        'creation',
        'gate_exit_date',
        'modified',
        'modified_by',
        'weighment_date'
      ];
      for (String key in keysToRemove) {
        formData.remove(key);
      }

      final reqMap = lines
        ..where((element) => element.name == null)
        ..map((e) => removeNullValues(e.toJson())).toList();
      final requestConfig = RequestConfig(
        url: Urls.updateGateExit,
        body: jsonEncode(removeNullValues({
          'ge_id': form.name, 
          'gate_exit_lines': reqMap, 
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
    });
  }

  @override
  AsyncValueOf<String> createGateExit(
      GateExitForm form, List<GateEntryLinesForm> lines) async {
    return await executeSafely(() async {
      final fromJson = form.toJson();
      fromJson.update('status', (value) => 'Draft');
      final files = {
        'drivers_license_photo': form.licensePhotoImg,
        'vehicle_image': form.vehiclePhotoImg,
        'seal_photo': form.sealPhotoImg,
        'breath_analyser': form.breathAnalyserImg,
        'invoicedc_image_ocr_scanning': form.invoiceImg.firstOrNull
      };
      final addFiles = <File>[];
      if (form.invoiceImg.length > 1) {
        for (int i = 1; i < form.invoiceImg.length; i++) {
          addFiles.add(form.invoiceImg.elementAt(i));
        }
      }
      files.removeWhere((key, value) => value == null);
      final responseurlMap = <String, dynamic>{};
      final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      for (final file in files.keys) {
        final indx = files.keys.toList().indexOf(file);
        responseurlMap[file] = urls.elementAtOrNull(indx);
      }
      final formJson = {...removeNullValues(form.toJson()), ...responseurlMap};
      final config = RequestConfig(
        url: Urls.createGateExit,
        parser: (p0) => p0['message']['data'] as String,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(removeNullValues(formJson)),
      );
      final response = await post(config);
      return response.processAsync((r) async {
        final docNo = r.data!;
        if (addFiles.isNotEmpty) {
          await _uploadAddfiles(addFiles, docNo);
        }
        await updateGateExit(form.copyWith(name: r.data), lines);

        return right(docNo);
      });
    });
  }

  @override
  AsyncValueOf<String> submitGateExit(
      GateExitForm form, List<GateEntryLinesForm> lines) async {
    return await executeSafely(() async {
      final unsavedLines = lines.where((e) => e.name.doesNotHaveValue);
      await updateGateExit(
          form.copyWith(name: form.name), unsavedLines.toList());
      final files = {
        'drivers_license_photo': form.licensePhotoImg,
        'vehicle_image': form.vehiclePhotoImg,
        'seal_photo': form.sealPhotoImg,
        'breath_analyser': form.breathAnalyserImg,
        'invoicedc_image_ocr_scanning': form.invoiceImg.firstOrNull,
      };
      final addFiles = <File>[];
      if (form.invoiceImg.length > 1) {
        for (int i = 1; i < form.invoiceImg.length; i++) {
          addFiles.add(form.invoiceImg.elementAt(i));
        }
      }
      files.removeWhere((key, value) => value == null);
      final responseurlMap = <String, dynamic>{};
      final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      for (final file in files.keys) {
        final indx = files.keys.toList().indexOf(file);
        responseurlMap[file] = urls.elementAtOrNull(indx);
      }
      final finalMap = {
        ...removeNullValues(form.toJson()),
        ...responseurlMap,
      };
       if(form.deletedLines.isNotEmpty){
     await deleteLines(form.name!,form.deletedLines);

      }
      await _uploadAddfiles(addFiles, form.name!);

      final reqBody = finalMap..remove('status');
      final config = RequestConfig(
        url: Urls.submitGateExit,
        parser: (json) {
          final data = json['message']['message'] as String;
          return data;
        },
        body: jsonEncode({"gate_Exit_id": form.name, ...reqBody}),
      );
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<GateEntryLinesForm>> fetchExitLines(String itemName) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: '${Urls.defaultGateExit}/$itemName',
        parser: (json) {
          final data = json['data']['gate_exit_lines'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => GateEntryLinesForm.fromJson(e)).toList();
        },
        reqParams: {
          'limit': 20,
          'order_by': 'name DESC',
          'doctype': 'Gate Exit Lines',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<ReceiverAddressForm>> receiverAddress(String id) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.receiverAddress,
        reqParams: {'receiver_id': id, 'limit_page_length': 'None'},
        parser: (p0) {
          final data = p0['message']['data'] as List<dynamic>;
          return data.map((e) => ReceiverAddressForm.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<ReceiverNameForm>> receiverName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.customerName,
        reqParams: {
          'fields': ['name', 'customer_name', 'gstin'],
          'limit_page_length': 'None'
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => ReceiverNameForm.fromJson(e)).toList();
        },
      );
      final response = await get(config);

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
          'attached_to_doctype': DocTypes.gateExit,
          'attached_to_field': 'invoicedc_image_ocr_scanning',
          'attached_to_name': name,
        },
      );
      final response = await multiPart(config);
      return response.process((r) => right(r.data!));
    });
  }

  AsyncValueOf<List<String>> _uploadfiles(List<File> files) async {
    return await executeSafely(() async {
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
  AsyncValueOf<String> deleteLines(String id, List<String> lines) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.deleteLines,
        parser: (json) => json,
        body: jsonEncode({
           "doctype": "Gate Exit", 
          "ge_id": id, 
          "lines": lines}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'

        });
       
      
      final response = await post(config);

      return response.process((r) => right('Successfully Deleted'));
    });
  }
}
