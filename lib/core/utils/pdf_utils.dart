
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

 
// class PdfUtils {
//   PdfUtils._();

//   static Future<Uint8List> imagesToPdf(List<File> images, {
//     String fileNamePrefix = 'document'
//   }) async {
//     if (images.isEmpty) throw Exception("No images selected");

//     final pdf = pw.Document();

//     for (final file in images) {

//       final Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
//         file.absolute.path,
//         minWidth: 1240, 
//         minHeight: 1754,
//         quality: 90,
//         format: CompressFormat.jpeg, 
//       );

//       if (compressedBytes == null) continue;


//       img.Image? decoded = img.decodeImage(compressedBytes);

//       if (decoded != null) {
        

        

//         decoded = img.grayscale(decoded);


        
//         decoded = img.adjustColor(
//           decoded, 

//           gamma: 1.8, 
          

//           contrast: 1.4, 
          

//           exposure: 0.15, 
//         );


//         for (var pixel in decoded) {
//            final lum = pixel.luminanceNormalized;
//            // If it's lighter than 85% gray, make it pure white
//            if (lum > 0.85) {
//              pixel.setRgb(255, 255, 255);
//            }

//         }



//         final processedBytes = img.encodePng(decoded);
//         final pwImage = pw.MemoryImage(processedBytes);

//         pdf.addPage(
//           pw.Page(
//             pageFormat: PdfPageFormat.a4,
//             margin: pw.EdgeInsets.zero,
//             build: (context) => pw.FullPage(
//               ignoreMargins: true,
//               child: pw.FittedBox(
//                 fit: pw.BoxFit.contain,
//                 child: pw.Image(pwImage),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     return pdf.save();
//   }
// }

// // class PdfUtils {
// //   PdfUtils._();

// //   static Future<Uint8List> imagesToSinglePdf(
// //     List<File> images, {
// //     String fileNamePrefix = 'document',
// //   }) async {
// //     print('Converting ${images.length} images to single PDF...');
// //     if (images.isEmpty) {
// //       throw ArgumentError('images must not be empty');
// //     }

// //     final pdf = pw.Document();

// //     for (final image in images) {
// //       if (!await image.exists()) {
// //         throw Exception('Image file does not exist: ${image.path}');
// //       }

// //       final bytes = await image.readAsBytes();
// //       if (bytes.isEmpty) {
// //         throw Exception('Image file is empty: ${image.path}');
// //       }
// //       final decoded = img.decodeImage(bytes);
// //       if (decoded == null) {
// //         throw Exception('Failed to decode image: ${image.path}');
// //       }

// //       const dpi = 300;
// //       const a4WidthIn = 8.27;
// //       const a4HeightIn = 11.69;
// //       final targetW = (a4WidthIn * dpi).round();
// //       final targetH = (a4HeightIn * dpi).round();


// //       final resized = img.copyResize(
// //         decoded,
// //         width: targetW,
// //         height: targetH,
// //         interpolation: img.Interpolation.cubic,
// //       );


// //       final gray = img.grayscale(resized);


// //       var minV = 255;
// //       var maxV = 0;
// //       for (var y = 0; y < gray.height; y++) {
// //         for (var x = 0; x < gray.width; x++) {
// //           final lumNum = img.getLuminance(gray.getPixel(x, y)); // num
// //           final lum = lumNum.round().clamp(0, 255);
// //           if (lum < minV) minV = lum;
// //           if (lum > maxV) maxV = lum;
// //         }
// //       }
// //       if (maxV > minV) {
// //         for (var y = 0; y < gray.height; y++) {
// //           for (var x = 0; x < gray.width; x++) {
// //             final lumNum = img.getLuminance(gray.getPixel(x, y));
// //             final lum = lumNum.round().clamp(0, 255);
// //             final stretched =
// //                 ((lum - minV) * 255 ~/ (maxV - minV)).clamp(0, 255);
// //             gray.setPixelRgba(x, y, stretched, stretched, stretched, 255);
// //           }
// //         }
// //       }
// //       final histogram = List<int>.filled(256, 0);
// //       for (var y = 0; y < gray.height; y++) {
// //         for (var x = 0; x < gray.width; x++) {
// //           final lumNum = img.getLuminance(gray.getPixel(x, y));
// //           final lum = lumNum.round().clamp(0, 255);
// //           histogram[lum]++;
// //         }
// //       }


// //       final totalPixels = gray.width * gray.height;
// //       double sum = 0;
// //       for (var i = 0; i < 256; i++) {
// //         sum += i * histogram[i];
// //       }

// //       double sumB = 0;
// //       int wB = 0;
// //       double varMax = 0;
// //       int threshold = 0;

// //       for (var i = 0; i < 256; i++) {
// //         wB += histogram[i];
// //         if (wB == 0) continue;

// //         final wF = totalPixels - wB;
// //         if (wF == 0) break;

// //         sumB += i * histogram[i];

// //         final mB = sumB / wB;
// //         final mF = (sum - sumB) / wF;

// //         final varBetween = wB * wF * (mB - mF) * (mB - mF);

// //         if (varBetween > varMax) {
// //           varMax = varBetween;
// //           threshold = i;
// //         }
// //       }

// //       final bin = img.Image.from(gray);
// //       for (var y = 0; y < bin.height; y++) {
// //         for (var x = 0; x < bin.width; x++) {
// //           final lumNum = img.getLuminance(bin.getPixel(x, y));
// //           final lum = lumNum.round().clamp(0, 255);
// //           final value = lum <= threshold ? 0 : 255;
// //           bin.setPixelRgba(x, y, value, value, value, 255);
// //         }
// //       }

// //       final processedBytes = img.encodePng(bin);

// //       log('Adding processed image: ${image.path}, size: ${processedBytes.length}');

// //       final pwImage = pw.MemoryImage(processedBytes);

// //       pdf.addPage(
// //         pw.Page(
// //           pageFormat: PdfPageFormat.a4,
// //           margin: pw.EdgeInsets.zero,
// //           build: (context) => pw.FullPage(
// //             ignoreMargins: true,
// //             child: pw.FittedBox(
// //               fit: pw.BoxFit.contain,
// //               child: pw.Image(pwImage),
// //             ),
// //           ),
// //         ),
// //       );
// //     }

// //     final pdfBytes = await pdf.save();

// //     if (pdfBytes.isEmpty) {
// //       throw Exception('PDF generation failed: empty bytes');
// //     }

// //     final header = String.fromCharCodes(pdfBytes.take(4));
// //     if (!header.startsWith('%PDF')) {
// //       throw Exception(
// //           'Invalid PDF generated: missing PDF header. Got: $header');
// //     }



// //     return pdfBytes;
// //   }
// // }


// // class PdfUtils {
// //   PdfUtils._();

// //   static Future<Uint8List> imagesToSinglePdf(
// //     List<File> images, {
// //     String fileNamePrefix = 'document',
// //   }) async {
// //     if (images.isEmpty) {
// //       throw ArgumentError('images must not be empty');
// //     }

// //     final pdf = pw.Document();

// //     for (final image in images) {
// //       if (!await image.exists()) {
// //         throw Exception('Image file does not exist: ${image.path}');
// //       }

// //       final bytes = await image.readAsBytes();
// //       if (bytes.isEmpty) {
// //         throw Exception('Image file is empty: ${image.path}');
// //       }


// //       var decoded = img.decodeImage(bytes);
// //       if (decoded == null) {
// //         throw Exception('Failed to decode image: ${image.path}');
// //       }


// //       const dpi = 300;
// //       const a4WidthIn = 8.27;
// //       const a4HeightIn = 11.69;
// //       final targetW = (a4WidthIn * dpi).round();
// //       final targetH = (a4HeightIn * dpi).round();


// //       decoded = img.copyResize(
// //         decoded,
// //         width: targetW,
// //         height: targetH,
// //         interpolation: img.Interpolation.cubic,
// //       );


// //       decoded = img.grayscale(decoded);


// //       decoded = img.adjustColor(decoded, contrast: 1.5);


// //       const int fixedThreshold = 150;

// //       for (var y = 0; y < decoded.height; y++) {
// //         for (var x = 0; x < decoded.width; x++) {
// //           final pixel = decoded.getPixel(x, y);
// //           final lum = img.getLuminance(pixel);


// //           final val = lum <= fixedThreshold ? 0 : 255;


// //           decoded.setPixelRgba(x, y, val, val, val, 255);
// //         }
// //       }


// //       final processedBytes = img.encodePng(decoded);



// //       final pwImage = pw.MemoryImage(processedBytes);


// //       pdf.addPage(
// //         pw.Page(
// //           pageFormat: PdfPageFormat.a4,
// //           margin: pw.EdgeInsets.zero,
// //           build: (context) => pw.FullPage(
// //             ignoreMargins: true,
// //             child: pw.FittedBox(
// //               fit: pw.BoxFit.contain,
// //               child: pw.Image(pwImage),
// //             ),
// //           ),
// //         ),
// //       );
// //     }

// //     final pdfBytes = await pdf.save();

// //     if (pdfBytes.isEmpty) {
// //       throw Exception('PDF generation failed: empty bytes');
// //     }

// //     return pdfBytes;
// //   }
// // }





// class PdfUtils {
//   PdfUtils._();

//   static Future<Uint8List> imagesToPdf(List<File> images, {
//     String fileNamePrefix = 'document'
//   }) async {
//     if (images.isEmpty) throw Exception("No images selected");

//     final pdf = pw.Document();

//     for (final file in images) {

//       final Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
//         file.absolute.path,
//         minWidth: 1240, 
//         minHeight: 1754,
//         quality: 90,
//         format: CompressFormat.jpeg, 
//       );

//       if (compressedBytes == null) continue;

//       // 2. Decode


//       if (decoded != null) {
        

        

//         decoded = img.grayscale(decoded);



        
//         decoded = img.adjustColor(
//           decoded, 

//           gamma: 1.8, 
          

//           contrast: 1.4, 
          

//           exposure: 0.15, 
//         );



//         for (var pixel in decoded) {
//            final lum = pixel.luminanceNormalized;

//            if (lum > 0.85) {
//              pixel.setRgb(255, 255, 255);
//            }

//         }



//         final processedBytes = img.encodePng(decoded);
//         final pwImage = pw.MemoryImage(processedBytes);

//         pdf.addPage(
//           pw.Page(
//             pageFormat: PdfPageFormat.a4,
//             margin: pw.EdgeInsets.zero,
//             build: (context) => pw.FullPage(
//               ignoreMargins: true,
//               child: pw.FittedBox(
//                 fit: pw.BoxFit.contain,
//                 child: pw.Image(pwImage),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     return pdf.save();
//   }
// }


class PdfUtils {
  PdfUtils._();

  static Future<Uint8List> imagesToPdf(
    List<File> images, {
    String fileNamePrefix = 'document',
  }) async {
    if (images.isEmpty) throw Exception('No images selected');

    final pdf = pw.Document();

    for (final file in images) {
      // Compress image for PDF (fast)
      final Uint8List? compressedBytes =
          await FlutterImageCompress.compressWithFile(
        file.path,
        minWidth: 1240,   // A4 portrait width ~ 150 DPI
        minHeight: 1754,  // A4 portrait height ~ 150 DPI
        quality: 90,
        format: CompressFormat.jpeg,
      );

      if (compressedBytes == null) continue;

      final image = pw.MemoryImage(compressedBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.zero,
          build: (context) => pw.FullPage(
            ignoreMargins: true,
            child: pw.Image(image, fit: pw.BoxFit.contain),
          ),
        ),
      );
    }

    return pdf.save();
  }
}



// Uint8List _processImageOnBackgroundThread(Uint8List inputBytes) {

//   img.Image? decoded = img.decodeImage(inputBytes);

//   if (decoded == null) throw Exception("Failed to decode image");


//   decoded = img.grayscale(decoded);


//   const int threshold = 140; 
//   for (var pixel in decoded) {
//     final lum = pixel.luminanceNormalized;
//     if (lum < (threshold / 255.0)) {
//       pixel.setRgb(0, 0, 0);
//     } else {
//       pixel.setRgb(255, 255, 255);
//     }
//   }


//   return img.encodePng(decoded);
// }

// class PdfUtils {
//   PdfUtils._();

//   static Future<Uint8List> imagesToPdf(List<File> images, {
//     String fileNamePrefix = 'document'
//   }) async {
//     if (images.isEmpty) throw Exception("No images selected");

//     final pdf = pw.Document();

   
    
//     final List<Future<Uint8List?>> tasks = images.map((file) async {

//       final Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
//         file.absolute.path,
//         minWidth: 1240, 
//         minHeight: 1754,
//         quality: 90,
//         format: CompressFormat.jpeg, 
//       );

//       if (compressedBytes == null) return null;


//       return await compute(_processImageOnBackgroundThread, compressedBytes);
//     }).toList();


//     final List<Uint8List?> results = await Future.wait(tasks);

  
//     for (final processedBytes in results) {
//       if (processedBytes != null) {
//         final pwImage = pw.MemoryImage(processedBytes);
//         pdf.addPage(
//           pw.Page(
//             pageFormat: PdfPageFormat.a4,
//             margin: pw.EdgeInsets.zero,
//             build: (context) => pw.FullPage(
//               ignoreMargins: true,
//               child: pw.FittedBox(
//                 fit: pw.BoxFit.contain,
//                 child: pw.Image(pwImage),
//               ),
//             ),
//           ),
//         );
//       }
//     }


//     return pdf.save();
//   }
// }



// class PdfUtils {
//   PdfUtils._();

//   static Future<Uint8List> imagesToPdf(List<File> images,{
//     String fileNamePrefix = 'document'
//   }) async {
//     if (images.isEmpty) throw Exception("No images selected");

//     final pdf = pw.Document();

//     for (final file in images) {

      
//       final Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
//         file.absolute.path,
//         minWidth: 1240, 
//         minHeight: 1754,
//         quality: 90,
//         format: CompressFormat.jpeg, 
//       );

//       if (compressedBytes == null) continue;



//       img.Image? decoded = img.decodeImage(compressedBytes);

//       if (decoded != null) {

//         decoded = img.grayscale(decoded);


        


//         const int threshold = 100; 

//         for (var pixel in decoded) {

//            final lum = pixel.luminanceNormalized; 
           

//            if (lum < (threshold / 255.0)) {
//              pixel.setRgb(0, 0, 0); // Black
//            } else {
//              pixel.setRgb(255, 255, 255); 
//            }
//         }


//         final processedBytes = img.encodePng(decoded);
//         final pwImage = pw.MemoryImage(processedBytes);

        
//       pdf.addPage(
//         pw.Page(
//           pageFormat: PdfPageFormat.a4,
//           margin: pw.EdgeInsets.zero,
//           build: (context) => pw.FullPage(
//             ignoreMargins: true,
//             child: pw.FittedBox(
//               fit: pw.BoxFit.contain,
//               child: pw.Image(pwImage),
//             ),
//           ),
//         ),
//       );
//     }
//     }


//     return pdf.save();
//   }
// }
