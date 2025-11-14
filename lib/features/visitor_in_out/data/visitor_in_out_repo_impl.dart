import 'dart:convert';
import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/visitor_in_out/data/visitor_in_out_repo.dart';
import 'package:aparna_pod/features/visitor_in_out/model/visitor_in_out_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VisitorInOutRepo)
class VisitorInOutRepoImpl extends BaseApiRepository
    implements VisitorInOutRepo {
  const VisitorInOutRepoImpl(super.client);

  @override
  AsyncValueOf<List<VisitorInOutForm>> fetchVisitorInOutList(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => VisitorInOutForm.fromJson(e)).toList();
      },
      reqParams: {
        'filters': [
          if (search.containsValidValue) ["visitor_name", "Like", "%$search%"],
          if (docStatus != null) ["docstatus", "=", docStatus],
        ],
        'limit_start': start,
        'limit': 20,
        'doctype': 'Visitor In Out Register',
        'order_by': 'creation DESC',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<String> createVisitorInOut(VisitorInOutForm form) async {
    try {
      final formJson = VisitorInOutForm.toEncodedFormJson(form);
      final config = RequestConfig(
        url: Urls.createVisitorInOut,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        parser: (p0) => p0['message']['data'] as String,
        body: jsonEncode(formJson),
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((r) {
        final docNo = r.data!;
        return right(docNo);
      });
    } on Exception catch (e, st) {
      $logger.error('[Visitor In Out Creation]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  @override
  AsyncValueOf<String> submitVisitorInOut(String id, String time) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          url: Urls.submitVisitorInOut,
          parser: (json) {
            final data = json['message']['message'] as String;
            return data;
          },
          body: jsonEncode({
            "in_out_id": id,
            "visitor_out_time": time,
          }));

      final response = await post(config);
      return response.process((r) {
        return right(r.data!);
      });
    });
  }

  // @override
  // AsyncValueOf<InviteVisitorForm> fetchVisitor(String? search) async {
  //   return await executeSafely(() async {
  //     final requestConfig = RequestConfig(
  //       url: Urls.getList,
  //       parser: (json) {
  //         final data = json['message'];

  //         final listdata = data as List<dynamic>;
  //         return listdata.map((e) => InviteVisitorForm.fromJson(e));
  //       },
  //       reqParams: {
  //         'filters': [
  //           if (search.containsValidValue) ["name", "=", "$search"],
  //         ],
  //         'limit': 1,
  //         'doctype': 'Invite Visitor',
  //         'fields': ["*"]
  //       },
  //       headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  //     );
  //     $logger.devLog(requestConfig);

  //     final response = await get(requestConfig);
  //     return response.process((r) {
  //       final list = r.data;
  //       if (list == null || list.isEmpty) {
  //         return left(const Failure(error: 'Scan Valid Visitor ID'));
  //       }
  //       return right(list.first);
  //     });
  //   });
  // }
   @override
  AsyncValueOf<VisitorInOutForm> fetchVisitor(String? search) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => VisitorInOutForm.fromJson(e));
        },
        reqParams: {
          'filters': [
            if (search.containsValidValue) ["name", "=", "$search"],
          ],
          'limit': 1,
          'doctype': 'Visitor In Out Register',
          'fields': ["*"]
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog('requestConfig==:$requestConfig');

      final response = await get(requestConfig);
      return response.process((r) {
        final list = r.data;
        if (list == null || list.isEmpty) {
          return left(const Failure(error: 'Scan Valid Visitor ID'));
        }
        return right(list.first);
      });
    });
  }

  @override
  AsyncValueOf<String> createInOut(
      String? qrcode, String? inTime) async {
    try {
      final config = RequestConfig(
        url: Urls.createVisitorInOut,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        parser: (p0) => p0['message']['data'] as String,
        body: jsonEncode({"qr_scanner": qrcode, "visitor_in_time": inTime}),
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((r) {
        final docNo = r.data!;
        return right(docNo);
      });
    } on Exception catch (e, st) {
      $logger.error('[Visitor In Out Creation]', e, st);
      return left(Failure(error: e.toString()));
    }
  }
}
