import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/data/gate_entry_repo.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';
import 'package:aparna_pod/core/utils/pdf_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';

@LazySingleton(as: GateEntryRepo)
class GateEntryRepoImpl extends BaseApiRepository implements GateEntryRepo {
  const GateEntryRepoImpl(super.client);

  @override
  AsyncValueOf<List<PodUploadForm>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => PodUploadForm.fromJson(e)).toList();
      },
      reqParams: {
        if (!(docStatus == null)) ...{
          'filters': [
            ['docstatus', '=', docStatus],
            if (search.containsValidValue) ...{
              ['name', 'Like', '%$search%']
            }
          ],
        },
        'limit_start': start,
        'limit': 20,
        'order_by': 'creation DESC',
        'doctype': 'POD Invoice',
        'fields': ['*']
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    $logger.devLog(response);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createGateEntry(PodUploadForm form) async {


    final List<Map<String, dynamic>> filesList = [];
    final formattedDate = () {
      try {
        if (form.invoiceDate != null && form.invoiceDate!.isNotEmpty) {
          final cleaned =
              form.invoiceDate!.replaceAll('.', '-').replaceAll(' ', '-');

          final parsedDate = DateFormat('dd-MM-yyyy').parseStrict(cleaned);
          return DateFormat('dd-MM-yyyy').format(parsedDate);
        }
      } catch (_) {}
      return form.invoiceDate ?? '';
    }();
    if (form.invoiceFiles != null && form.invoiceFiles!.isNotEmpty) {
      try {
        final pdfBytes = await PdfUtils.imagesToPdf(
          form.invoiceFiles!,
          fileNamePrefix: 'invoice',
        );
        if (pdfBytes.isEmpty) {
          throw Exception('PDF generation failed: empty PDF bytes');
        }
        final base64String = base64Encode(pdfBytes);
        if (base64String.isEmpty) {
          throw Exception('Base64 encoding failed: empty string');
        }
        String finalFileName = '';
        if (form.deliveryChallanNo != null &&
            form.deliveryChallanNo!.isNotEmpty) {
              finalFileName = '${form.deliveryChallanNo}_deliveryChallan.pdf';
        } else {
          finalFileName = '${form.sapNo}_invoice.pdf';
          }

        filesList.add({
          'filename': finalFileName,
          'filedata': base64String,
        });

      } catch (e, stackTrace) {
        $logger.error('Error in PDF conversion process: $e', e, stackTrace);
        rethrow;
      }
    }

    final payload = {
      'plant_code': form.plantCode,
      'invoice_date': formattedDate,
      'sap_no': form.deliveryChallanNo != null ? null : form.sapNo,
      'invoice_no': form.deliveryChallanNo != null ? null : form.invoiceNo,
      'delivery_challan_no': form.deliveryChallanNo,
      'files': filesList,
      'remarks': form.remarks,
    };
    final requestConfig = RequestConfig(
      url: Urls.podUpload,
      body: jsonEncode(payload),
      parser: (json) {
        final message = json['message']['message'] as String;
        final docNo = json['message']['pod_invoice'] as String? ?? '';
        return Pair(message, docNo);
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);

    final response = await post(requestConfig);
    $logger.devLog('........response $response');

    return response.processAsync((r) async {
      return right(Pair(r.data!.first, r.data!.second));
    });
  }

  Future<Uint8List?> fetchAndConvertToBase64(String relativePath) async {
    if (p.extension(relativePath).isEmpty) {
      return null;
    }

    final String url = Urls.filepath(relativePath);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load file: ${response.statusCode}');
    }
  }
}
