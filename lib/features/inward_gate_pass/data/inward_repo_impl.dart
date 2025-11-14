import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/consts/doctypes.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/inward_gate_pass/data/inward_repo.dart';
import 'package:aparna_pod/features/inward_gate_pass/model/inward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InwardRepo)
class InwardRepoImpl extends BaseApiRepository implements InwardRepo {
  const InwardRepoImpl(super.client);

  @override
  AsyncValueOf<List<InwardForm>> fetchInwards(
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
          return listdata.map((e) => InwardForm.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            if (search.containsValidValue) ["name", "Like", "%$search%"],
            if (docStatus != null) ["docstatus", "=", docStatus],
          ],
          'limit_start': start,
          'limit': 20,
          'doctype': 'Inward Gate Pass RGP',
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
  AsyncValueOf<List<OutwardForm>> fetchOutwards() async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.outwardlist,
        parser: (json) {
          final data = json['message']['data'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => OutwardForm.fromJson(e)).toList();
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog('ooutward config: $requestConfig');
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

@override
AsyncValueOf<String> createInwardGatePass(
    InwardForm form, List<ItemsForm> lines) async {
  return await executeSafely(() async {
    final fromJson = InwardForm.toEncodedFormJson(form);

    fromJson['status'] = 'Draft';

    // Assigning pendingQty values to the "quantity" key
    fromJson['quantity'] = lines.map((e) => e.pendingQty).toList();

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

    formJson['gate_pass_date'] = DFU.toPostDate(form.gatePassDate);

    final config = RequestConfig(
      url: Urls.createInward,
      parser: (p0) => p0['message']['inward_gatepass'] as String,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(formJson),
    );
    $logger.devLog('CREATE reqbody: $config');
    final response = await post(config);
    return response.processAsync((r) async {
      final docNo = r.data!;
      return right(docNo);
    });
  });
}



  @override
  AsyncValueOf<String> updateInward(
      InwardForm form, List<ItemsForm> lines) async {
    return await executeSafely(() async {
      final formData = removeNullValues(form.toJson());
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
        url: Urls.updateInward,
        body: jsonEncode(removeNullValues({
          'inward_id': form.name,
          "authorised_by": form.authorisedBy,
          'inward_gatepass_items': reqMap,
          ...formData,
        })),
        parser: (json) {
          final data = json['message']['message'];
          return data;
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog('UPDATE Config: $requestConfig');

      final response = await post(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> submitInwardGatePass(
      InwardForm form, List<ItemsForm> lines) async {
    final unsavedLines = lines.where((e) => e.name.doesNotHaveValue);
    await updateInward(form.copyWith(name: form.name), unsavedLines.toList());
    return await executeSafely(() async {
      if (form.deletedLines.isNotEmpty) {
        await deleteLines(form.name!, form.deletedLines);
      }

      final config = RequestConfig(
        url: Urls.submitInward,
        parser: (json) {
          final data = json['message']['message'] as String;
          return data;
        },
        body: jsonEncode({
          "inward_gatepass_id": form.name,
        }),
      );

      $logger.devLog('submit config: $config');
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<ItemsForm>> fetchInwardLines(String itemName) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: '${Urls.defaultInward}/$itemName',
        parser: (json) {
          $logger.devLog('JSON: $json');
          final data = json['data']['inward_gate_pass_items'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => ItemsForm.fromJson(e)).toList();
        },
        reqParams: {
          'limit': 20,
          'order_by': 'name DESC',
          'doctype': 'Inward Gate Pass RGP',
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
          body: jsonEncode({
            "doctype": "Inward Gate Pass RGP",
            "record_id": id,
            "items": lines
          }),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      $logger.devLog("DELETE config:$config");

      final response = await post(config);

      return response.process((r) => right('Successfully Deleted'));
    });
  }
}
