import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/data/empty_vehicle_repo.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EmptyVehicleRepo)
class EmptyVehicleRepoImpl extends BaseApiRepository
    implements EmptyVehicleRepo {
  const EmptyVehicleRepoImpl(super.client);

  @override
  AsyncValueOf<List<EmptyVehicleForm>> fetchEmptyVehicleList(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => EmptyVehicleForm.fromJson(e)).toList();
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
        'doctype': 'Empty Vehicle Tracking',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createEmptyVehicle(EmptyVehicleForm form) async {
    return await executeSafely(() async {
      final files = {'vehicle_photo': form.vehicleImg};
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
      finalMap.update('date', (_) {
        return DFU.toPostDate(form.date);
      });
      final requestConfig = RequestConfig(
        url: Urls.createEmptyVehicle,
        body: jsonEncode(finalMap),
          parser: (json) {
        final mesg = json['message']['message'] as String;
        final docNo = json['message']['data'] as String;
        return Pair(mesg, docNo);
      },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      $logger.devLog(requestConfig);
      final response = await post(requestConfig);
      return response.process((r) => right(Pair(r.data!.first, r.data!.second)));
    });
  }

  @override
  AsyncValueOf<String> updateEmptyVehicle(EmptyVehicleForm form) async {
    return await executeSafely(() async {
      final formData = removeNullValues(form.toJson());
         const keysToRemove = [
        'name',
        'creation',
        'modified',
        'modified_by',
        'date'
      ];
      for (String key in keysToRemove) {
        formData.remove(key);
      }
        
      final config = RequestConfig(
          url: Urls.updateEmptyVehicle,
          parser: (json) {
            final data = json['message']['message'] as String;
            return data;
          },
          body: jsonEncode(
              {"empty_vehicle_tracking_id": form.name, ...formData}));
      $logger.devLog(config);

      final response = await post(config);
      return response.process((r) {
        return right(r.data!);
      });
    });
  }

  @override
  AsyncValueOf<String> submitEmptyVehicle(EmptyVehicleForm form) async {
    await updateEmptyVehicle(form.copyWith(name: form.name));
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.submitEmptyVehicle,
          parser: (json) {
            final data = json['message']['message'] as String;
            return data;
          },
          body: jsonEncode({"empty_vehicle_tracking_id": form.name}));
      $logger.devLog(config);

      final response = await post(config);
      return response.process((r) {
        return right(r.data!);
      });
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

  @override
  AsyncValueOf<List<SupplierNameForm>> supplierName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.supplierName,
        reqParams: {
          'fields': ['*'],
          'filters': [
            ["is_transporter", "=", "1"]
          ],
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
}
