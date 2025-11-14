import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';

import 'package:aparna_pod/features/incident_register/data/incident_register_repo.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IncidentRegistersRepo)
class IncidentRegistersRepoImpl extends BaseApiRepository
    implements IncidentRegistersRepo {
  const IncidentRegistersRepoImpl(super.client);

  @override
  AsyncValueOf<List<IncidentRegisterForm>> fetchIncidentRegister(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => IncidentRegisterForm.fromJson(e)).toList();
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
        'doctype': 'Incident Register',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createIncentRegister(
      IncidentRegisterForm form) async {
    return await executeSafely(() async {
      final files = {'photo': form.incPhotoImg};
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
      final requestConfig = RequestConfig(
        url: Urls.createIncidentRegister,
        body: jsonEncode(finalMap),
        parser: (json) {
          final mesg = json['message']['message'] as String;
          final docNo = json['message']['data'] as String;
          return Pair(mesg, docNo);
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await post(requestConfig);
      return response
          .process((r) => right(Pair(r.data!.first, r.data!.second)));
    });
  }

  @override
  AsyncValueOf<String> submitIncidentRegister(String id) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.submitIncidentRegister,
          parser: (json) {
            final data = json['message']['message'] as String;
            return data;
          },
          body: jsonEncode({"incident_register_id": id}));

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

  // @override
  // AsyncValueOf<List<String>> companyName() async {
  //   return await executeSafely(() async {
  //     final config = RequestConfig(
  //       url: Urls.companyName,
  //       reqParams: {'fields': ReceiverNameForm.fields,'limit_page_length':'None'},
  //       parser: (p0) {
  //         final data = p0['data'] as List<dynamic>;
  //         return data.map((e) => e['name'].toString()).toList();
  //       },
  //     );
  //     final response = await get(config);
  //     return response.process((r) => right(r.data!));
  //   });
  // }

  @override
  AsyncValueOf<List<String>> companyName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.companyName,
        reqParams: {
          'fields': ReceiverNameForm.fields,
          'limit_page_length': 'None',
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data
              .where((e) => (e['is_group'] ?? 0) != 1)
              .map((e) => e['name'].toString())
              .toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<String>> incidentType() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.incidentType,
        reqParams: {
          'fields': ['name'],
          'limit_page_length': 'None'
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => e['name'].toString()).toList();
        },
      );
      final response = await get(config);

      return response.process((r) => right(r.data!));
    });
  }
}
