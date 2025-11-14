import 'dart:convert';
import 'dart:io';
import 'package:aparna_pod/core/consts/doctypes.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/outward_gate_pass/data/outward_repo.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/uom_list_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OutwardRepo)
class OutwardRepoImpl extends BaseApiRepository implements OutwardRepo {
  const OutwardRepoImpl(super.client);

  @override
  AsyncValueOf<List<OutwardForm>> fetchOutwards(
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
          return listdata.map((e) => OutwardForm.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            if (search.containsValidValue) ["name", "Like", "%$search%"],
            if (docStatus != null) ["docstatus", "=", docStatus],
          ],
          'limit_start': start,
          'limit': 20,
          'doctype': 'Outward Gate Pass RGP',
          'order_by': 'creation DESC',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      final response = await get(requestConfig);
      $logger.devLog('RESPONSE:$response');
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> createOutwardGatePass(
      OutwardForm form, List<ItemsForm> lines) async {
    return await executeSafely(() async {
      final fromJson = OutwardForm.toEncodedFormJson(form);

      fromJson.update('status', (value) => 'Draft');
      final files = {
        'gatepass_image': form.gatePassImg,
      };

      files.removeWhere((key, value) => value == null);
      final responseurlMap = <String, dynamic>{};
      final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      for (final file in files.keys) {
        final indx = files.keys.toList().indexOf(file);
        responseurlMap[file] = urls.elementAtOrNull(indx);
      }
      final formJson = {...removeNullValues(fromJson), ...responseurlMap};

      formJson
        ..update('gate_pass_date', (_) {
          return DFU.toPostDate(form.gatePassDate);
        })
        ..update('outward_date', (_) {
          return DFU.toPostDate(form.outwardDate);
        });

      final config = RequestConfig(
        url: Urls.createOutward,
        parser: (p0) => p0['message']['outward_gatepass'] as String,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(formJson),
      );
      $logger.devLog('create config: $config');
      final response = await post(config);
      return response.processAsync((r) async {
        final docNo = r.data!;
        return right(docNo);
      });
    });
  }

  @override
  AsyncValueOf<String> updateOutward(
      OutwardForm form, List<ItemsForm> lines) async {
    return await executeSafely(() async {
      $logger.devLog('Lines:$lines');
      $logger.devLog('FORM:$form');
      final formData = removeNullValues(form.toJson());
      $logger.devLog('FORMDATA:$formData');
      const keysToRemove = [
        'name',
        'creation',
        'gate_pass_date',
        'modified',
        'modified_by',
        'outward_date'
      ];
      for (String key in keysToRemove) {
        formData.remove(key);
      }

      final reqMap = form.items
        ..where((element) => element.name == null)
        ..map((e) => removeNullValues(e.toJson())).toList();
      final requestConfig = RequestConfig(
        url: Urls.updateOutward,
        body: jsonEncode(removeNullValues({
          "outward_id": form.name,
          "authorised_by": form.authorisedBy,
          'outward_gatepass_items': reqMap,
          ...formData
        })),
        parser: (json) {
          final data = json['message']['message'];
          return data;
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog('Update Config: $requestConfig');

      final response = await post(requestConfig);
      $logger.devLog('');
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> submitOutwardGatePass(
      OutwardForm form, List<ItemsForm> lines) async {
    final unsavedLines = lines.where((e) => e.name.doesNotHaveValue);
    await updateOutward(form.copyWith(name: form.name), unsavedLines.toList());
    return await executeSafely(() async {
       if(form.deletedLines.isNotEmpty){
     await deleteLines(form.name!,form.deletedLines);
      }
      final config = RequestConfig(
        url: Urls.submitOutward,
        parser: (json) {
          final data = json['message']['message'] as String;
          return data;
        },
        body: jsonEncode({"outward_gatepass_id": form.name}),
      );

      $logger.devLog('config submit: $config');
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<ItemsForm>> fetchOutwardLines(String itemName) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: '${Urls.defaultOutward}/$itemName',
        parser: (json) {
          $logger.devLog('JSON: $json');
          final data = json['data']['outward_gate_pass_items'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => ItemsForm.fromJson(e)).toList();
        },
        reqParams: {
          'limit': 20,
          'order_by': 'name DESC',
          'doctype': 'Outward Gate Pass RGP',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog(requestConfig);
      final response = await get(requestConfig);

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
          url: Urls.removelines,
          parser: (json) => json,
          body:
              jsonEncode({"doctype": "Outward Gate Pass RGP", "record_id": id, "items": lines}),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
          $logger.devLog("DHGFHD:$config");

      final response = await post(config);

      return response.process((r) => right('Successfully Deleted'));
    });
  }

  @override
  AsyncValueOf<List<UomListForm>> uomList() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.uomList,
        reqParams: {'limit_page_length': 'None'},
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => UomListForm.fromJson(e)).toList();
        },
      );
      $logger.devLog(config);
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

    
}
