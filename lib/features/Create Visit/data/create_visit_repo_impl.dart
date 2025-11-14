import 'dart:convert';
import 'dart:io';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/data/create_visit_repo.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CreateVisitRepo)
class CreateVisitRepoImpl extends BaseApiRepository implements CreateVisitRepo {
  const CreateVisitRepoImpl(super.client);

  @override
  AsyncValueOf<List<CreateVisitForm>> fetchCreateVisitList(
    int start,
    String? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getVisitors,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => CreateVisitForm.fromJson(e)).toList();
      },
      reqParams: {
        if (search != null && search.isNotEmpty)...{
        "visit_id": search,

        },
        'status': docStatus,
        'limit_start': start,
        'limit': 20,
        'fields': ["*"],
        'user': user().email,
        'order_by': 'creation DESC',
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createVisit(CreateVisitForm form) async {
    return await executeSafely(() async {
      final formJson = CreateVisitForm.toEncodedFormJson(form);
      formJson.update('scheduled_date', (_) {
        return DFU.toPostDate(form.scheduledDate);
      });
      final files = {
        'face_photo': form.facePhotoImg,
        'photo_id_proof': form.idPhotoImg,
      };
      files.removeWhere(
        (key, value) => value == null,
      );
      final responseurlMap = <String, dynamic>{};
      final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      for (final file in files.keys) {
        final indx = files.keys.toList().indexOf(file);
        responseurlMap[file] = urls.elementAtOrNull(indx);
      }
      final finalMap = {
        ...removeNullValues(formJson),
        ...responseurlMap,
      };
      final config = RequestConfig(
        url: Urls.createVisit,
        parser: (json) {
          final mesg = json['message']['message'] as String;
          final docNo = json['message']['data'] as String;
          return Pair(mesg, docNo);
        },
        body: jsonEncode(finalMap),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog(config);
      final response = await post(config);
      return response
          .process((r) => right(Pair(r.data!.first, r.data!.second)));
    });
  }

  @override
  AsyncValueOf<String> submitVisitor(String id) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.submitVisit,
        parser: (json) {
          final data = json['message']['message'] as String;
          return data;
        },
        body: jsonEncode(
          {"create_visit_id": id},
        ),
      );
      final response = await post(config);
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

  @override
  AsyncValueOf<None> approveButton(String id, String action) async {
    final config = RequestConfig(
        url: Urls.approvalWorkFlow,
        parser: (json) => json,
        body: jsonEncode({
          "doc": {"doctype": "Create Visit", "name": id},
          "action": action
        }));
        $logger.devLog(config);

    final response = await post(config);
    return response.process((docNo) {
      return right(const None());
    });
  }

  @override
  AsyncValueOf<None> rejectButton(String id, String action) async {
    final config = RequestConfig(
        url: Urls.approvalWorkFlow,
        parser: (json) => json,
        body: jsonEncode({
          "doc": {"doctype": "Create Visit", "name": id},
          "action": action
        }));
        $logger.devLog(config);

    final response = await post(config);
    return response.process((docNo) {
      return right(const None());
    });
  }

  @override
  AsyncValueOf<None> sendforApprovalButton(String id, String action) async {
    final config = RequestConfig(
      url: Urls.approvalWorkFlow,
      parser: (json) => json,
      body: jsonEncode({
        "doc": {"doctype": "Create Visit", "name": id},
        "action": action,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(config);

    final response = await post(config);
    return response.process((docNo) {
      return right(const None());
    });
  }
    @override
  AsyncValueOf<bool> userPermission(String name) async {
    final requestConfig = RequestConfig(
      url: Urls.userPermission,
      parser: (json) {
        return json['message']['can_approve'] as bool;
      },
      reqParams: {"visit_id":name},
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }
}
