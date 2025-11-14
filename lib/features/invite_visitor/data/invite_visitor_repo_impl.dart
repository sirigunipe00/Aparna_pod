import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/core.dart';

import 'package:aparna_pod/features/invite_visitor/data/invite_visitor_repo.dart';
import 'package:aparna_pod/features/invite_visitor/model/department_form.dart';
import 'package:aparna_pod/features/invite_visitor/model/invite_visitor_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InviteVisitorRepo)
class InviteVisitorRepoImpl extends BaseApiRepository
    implements InviteVisitorRepo {
  const InviteVisitorRepoImpl(super.client);

  @override
  AsyncValueOf<List<InviteVisitorForm>> fetchVisitorList(
    int start,
    int? docStatus,
    String? search,
    // String? mobileNo,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => InviteVisitorForm.fromJson(e)).toList();
      },
      reqParams: {
        'filters': [
          if (search.containsValidValue) ["name", "Like", "%$search%"],
          if (docStatus != null) ["docstatus", "=", docStatus],
          // if (search.containsValidValue) ["visitor_mobile", "Like", "%$search%"],

        ],
        'limit_start': start,
        'limit': 20,
        'doctype': 'Invite Visitor',
        'order_by': 'name DESC',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<String> createInviteVisitor(InviteVisitorForm form) async {
    return await executeSafely(() async {
      final formJson = InviteVisitorForm.toEncodedFormJson(form);
      formJson.putIfAbsent('schedule_date', () {
        return DFU.toPostDate(form.scheduledDate);
      });
      final config = RequestConfig(
        url: Urls.createInviteVisitor,
        parser: (p0) => p0['message']['data'] as String,
        body: jsonEncode(formJson),
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<String> submitInviteVisitor(String id) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.submitInviteVisitor,
        parser: (json) {
          final data = json['message']['message'] as String;
          return data;
        },
        body: jsonEncode(
          {"invite_visitor_id": id},
        ),
      );
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<DepartmentForm>> departmentName() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.department,
        reqParams: {'fields': DepartmentForm.fields,'limit_page_length':'None'},
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => DepartmentForm.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }
  @override
  AsyncValueOf<InviteVisitorForm?> fetchVisitorss(String? search) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'];

          final listdata = data as List<dynamic>;
          return listdata.map((e) => InviteVisitorForm.fromJson(e));
        },
        reqParams: {
          'filters': [
            if (search.containsValidValue) ["visitor_mobile", "=", "$search"],
          ],
          'limit': 1,
          'limit_page_length':'None',
          'order_by': 'creation DESC',
          'doctype': 'Invite Visitor',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(requestConfig);
      return response.process((r) =>right(r.data!.firstOrNull) );
    });
  }

   
}
