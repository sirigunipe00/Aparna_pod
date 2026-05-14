import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class PdfUtils {
  PdfUtils._();

  static Future<Uint8List> imagesToPdf(
    List<File> images, {
    String fileNamePrefix = 'document',
  }) async {
    if (images.isEmpty) throw Exception('No images selected');
    final pdf = pw.Document();
    for (final file in images) {
      final Uint8List? compressedBytes =
          await FlutterImageCompress.compressWithFile(
        file.path,
        minWidth: 1240,
        minHeight: 1754,
        quality: 90,
        format: CompressFormat.jpeg,
      );

      if (compressedBytes == null) continue;

      final image = pw.MemoryImage(compressedBytes);

      // pdf.addPage(
      //   pw.Page(
      //     pageFormat: PdfPageFormat.a4,
      //     margin: pw.EdgeInsets.zero,
      //     build: (context) => pw.FullPage(
      //       ignoreMargins: true,
      //       child: pw.Image(image, fit: pw.BoxFit.contain),
      //     ),
      //   ),
      // );
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.zero,
          build: (context) => pw.Center(
            child: pw.Image(
              image,
              fit: pw.BoxFit.fitWidth,
            ),
          ),
        ),
      );
    }

    return pdf.save();
  }
}
