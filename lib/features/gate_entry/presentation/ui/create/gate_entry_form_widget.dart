import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

DocumentType detectDocumentType(String text) {
  final t = text.toLowerCase().replaceAll(RegExp(r'\s+'), ' ');

  if (t.contains('delivery challan number') || t.contains('delivery challan')) {
    return DocumentType.deliveryChallan;
  }

  return DocumentType.invoice;
}

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget> {
  String? lastCroppedPath;

  final ScrollController _scrollController = ScrollController();
  final invoiceNoController = TextEditingController();
  final invoiceDateController = TextEditingController();
  final deliveryChallanController = TextEditingController();
  final sapNoController = TextEditingController();
  final plantCodeController = TextEditingController();
  final remarks = TextEditingController();

  @override
  void dispose() {
    invoiceNoController.dispose();
    invoiceDateController.dispose();
    deliveryChallanController.dispose();
    sapNoController.dispose();
    plantCodeController.dispose();
    remarks.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  final focusNodes = List.generate(40, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    final formState = context.watch<CreateGateEntryCubit>().state;
    final isCompleted = formState.view == GateEntryView.completed;
    final newform = formState.form;

    $logger.devLog('form..............$newform');

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateGateEntryCubit, CreateGateEntryState>(
          listenWhen: (previous, current) {
            final prevStatus = previous.error?.status;
            final currStatus = current.error?.status;
            return prevStatus != currStatus;
          },
          listener: (_, state) async {
            final indx = state.error?.status;
            if (indx != null) {
              final focus = focusNodes.elementAt(indx);
              FocusScope.of(context).requestFocus(focus);
              await Scrollable.ensureVisible(
                focus.context!,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        controller: _scrollController,
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          children: [
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              buildWhen: (previous, current) =>
                  previous.form.invoiceFiles != current.form.invoiceFiles ||
                  previous.isNew != current.isNew,
              builder: (context, state) {
                final files = state.form.invoiceFiles;
                final hasFiles = files.isNotNull && files!.isNotEmpty;
                final shouldShow = state.isNew || hasFiles;

                if (!shouldShow) return const SizedBox.shrink();

                return PhotoSelectionWidget(
                  borderColor: AppColors.marigoldDDust,
                  fileName: 'Invoice_Photo',
                  defaultValue: files,
                  title: 'Invoice Photos',
                  isReadOnly: !state.isNew,
                  // onReCrop: (oldFile, newFile) async {
                  //   final updatedList = [...?state.form.invoiceFiles];
                  //   updatedList.remove(oldFile);

                  //   final updatedFile = File(newFile.path);
                  //   updatedList.add(updatedFile);

                  //   lastCroppedPath = updatedFile.path;

                  //   await extractTextFromImage(updatedFile.path);

                  //   context
                  //       .cubit<CreateGateEntryCubit>()
                  //       .onValueChanged(invoiceFiles: updatedList);
                  // },
                  // onFileCapture: (capturedFiles) {
                  //   if (!state.isNew) return;
                  //   context
                  //       .cubit<CreateGateEntryCubit>()
                  //       .onValueChanged(invoiceFiles: capturedFiles);
                  //   for (final f in capturedFiles) {
                  //     extractTextFromImage(f.path);
                  //   }
                  // },
                  onFileCapture: (capturedFiles) {
                    if (!state.isNew) return;

                    final cubit = context.cubit<CreateGateEntryCubit>();
                    final updatedList = List<File>.from(capturedFiles);

                    cubit.onValueChanged(invoiceFiles: updatedList);

                    if (updatedList.isEmpty) {
                      cubit.onValueChanged(
                        invoiceNo: null,
                        sapNo: null,
                        invoiceDate: null,
                        deliveryChallanNo: null,
                        plantCode: null,
                      );

                      invoiceNoController.clear();
                      sapNoController.clear();
                      invoiceDateController.clear();
                      deliveryChallanController.clear();
                      plantCodeController.clear();

                      debugPrint('🗑️ Images removed. Form data cleared.');
                    } else {
                      for (final f in updatedList) {
                        extractTextFromImage(f.path);
                      }
                    }
                  },
                );
              },
            ),

            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                return InputField(
                  readOnly: true,
                  key: UniqueKey(),
                  controller: plantCodeController,
                  initialValue: newform.plantCode,
                  title: 'Plant Code',
                  isRequired: false,
                  borderColor: AppColors.marigoldDDust,
                  onChanged: (p0) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(plantCode: p0);
                  },
                  focusNode: focusNodes.elementAt(6),
                );
              },
            ),
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                final form = state.form;

                if (form.deliveryChallanNo != null &&
                    form.deliveryChallanNo!.isNotEmpty) {
                  return const SizedBox.shrink();
                }

                return InputField(
                  readOnly: true,
                  key: UniqueKey(),
                  controller: invoiceNoController,
                  initialValue: form.invoiceNo,
                  title: 'Invoice No',
                  borderColor: AppColors.marigoldDDust,
                  maxLength: 10,
                  inputType: TextInputType.number,
                  onChanged: (v) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(invoiceNo: v);
                  },
                  focusNode: focusNodes.elementAt(7),
                );
              },
            ),

            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                final form = state.form;

                if (form.invoiceNo != null && form.invoiceNo!.isNotEmpty) {
                  return const SizedBox.shrink();
                }

                return InputField(
                  readOnly: true,
                  key: UniqueKey(),
                  controller: deliveryChallanController,
                  initialValue: newform.deliveryChallanNo,
                  title: 'Delivery Challan Number',
                  isRequired: false,
                  borderColor: AppColors.marigoldDDust,
                  onChanged: (p0) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(deliveryChallanNo: p0);
                  },
                  focusNode: focusNodes.elementAt(6),
                );
              },
            ),

            // BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
            //       //  buildWhen: (previous, current) => previous != current,
            //   builder: (context, state) {
            //     return
            InputField(
              readOnly: true,
              // key: UniqueKey(),
              controller: invoiceDateController,
              key: ValueKey(newform.invoiceDate),

              initialValue: (() {
                final dateStr = newform.invoiceDate;
                if (dateStr == null || dateStr.isEmpty) return null;
                final parsed = DateTime.tryParse(dateStr);
                return parsed != null ? DFU.ddMMyyyy(parsed) : dateStr;
              })(),
              onChanged: (p0) {
                // setState(() {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(invoiceDate: p0);
                // });
              },
              title: 'Invoice Date',
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(8),
            ),
            //   },
            // ),
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                final form = state.form;

                if (form.deliveryChallanNo != null &&
                    form.deliveryChallanNo!.isNotEmpty) {
                  return const SizedBox.shrink();
                }

                return InputField(
                  readOnly: true,
                  // key: UniqueKey(),
                  controller: sapNoController,
                  initialValue: form.sapNo,
                  title: 'SAP No',
                  borderColor: AppColors.marigoldDDust,
                  onChanged: (v) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(sapNo: v);
                  },
                  focusNode: focusNodes.elementAt(8),
                );
              },
            ),
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                return InputField(
                  controller: remarks,
                  minLines: 3,
                  readOnly: isCompleted,
                  borderColor: AppColors.marigoldDDust,
                  maxLines: 6,
                  hintText: 'Enter Here.....',
                  initialValue: newform.remarks,
                  title: 'Remarks (if any)',
                  onChanged: (text) {
                    context.cubit<CreateGateEntryCubit>().onValueChanged(
                          remarks: text,
                        );
                  },
                );
              },
            ),

// if (isCreating) ...[
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (_, state) {
                final shouldShowButton =
                    state.isNew && state.view == GateEntryView.create;
                if (!shouldShowButton) {
                  return const SizedBox.shrink();
                }

                return AppButton(
                    label: state.view.toName(),
                    isLoading: state.isLoading,
                    bgColor: AppColors.haintBlue,
                    margin: const EdgeInsets.all(12.0),
                    onPressed: () {
                      context.cubit<CreateGateEntryCubit>().save();
                    });
              },
            ),
// ],
          ],
        ),
      ),
    );
  }
//    String extractRowWiseText(RecognizedText recognizedText) {
//   final lines = <TextLineData>[];

//   for (final block in recognizedText.blocks) {
//     for (final line in block.lines) {
//       final box = line.boundingBox;
//       // if (box != null) {
//         lines.add(TextLineData(
//           text: line.text,
//           top: box.top,
//           left: box.left,
//         ));
//       // }
//     }
//   }


//   lines.sort((a, b) {
//     final yDiff = (a.top - b.top).abs();
//     if (yDiff < 12) {

//       return a.left.compareTo(b.left);
//     }
//     return a.top.compareTo(b.top);
//   });


//   return lines.map((e) => e.text).join('\n');
// }


  // Future<void> extractTextFromImage(String imagePath) async {
  //   final inputImage = InputImage.fromFilePath(imagePath);
  //   final textRecognizer = TextRecognizer();

  //   final recognizedText = await textRecognizer.processImage(inputImage);
  //   final fullText = recognizedText.text;

  //   debugPrint('📝 Extracted Text:\n$fullText');

  //   final docType = detectDocumentType(fullText);

  //   List<String> _extractAllDates(String text) {

  //     final patterns = [
  //       r'\b\d{2}[^0-9]{1,2}\d{2}[^0-9]{1,2}\d{4}\b',
  //       r'\b\d{2}(?:\.{1,2}|\s)\d{2}(?:\.{1,2}|\s)\d{4}\b',
  //       r'\b\d{2}\s\d{2}\s\d{4}\b',
  //     ];

  //     final dates = <String>[];

  //     for (var p in patterns) {
  //       dates.addAll(RegExp(p).allMatches(text).map((m) => m.group(0)!));
  //     }

  //     return dates;
  //   }

  //   String? selectInvoiceDate(List<String> dates) {
  //     if (dates.isEmpty) return null;

  //     if (dates.length == 1) {
  //       return dates.first;
  //     }

  //     return dates[1];
  //   }

  //   String? extractDeliveryChallanNo(String text) {
  //     final regex = RegExp(
  //       r'Delivery\s*Challan\s*Number\s*[:\-\s]*([\d]+)',
  //       caseSensitive: false,
  //     );
  //     return regex.firstMatch(text)?.group(1)?.trim() ??
  //         RegExp(r'\d{6,}').firstMatch(text)?.group(0);
  //   }

  //   List<String> getAllTenDigitNumbers(String text,
  //       {bool excludeHighStart = false}) {
  //     final regex = RegExp(r'\b\d{10}\b');
  //     return regex
  //         .allMatches(text)
  //         .map((m) => m.group(0)!)
  //         .where((num) => !excludeHighStart || num.startsWith(RegExp(r'[0-4]')))
  //         .toList();
  //   }

  //   final cubit = context.cubit<CreateGateEntryCubit>();

  //   final allDates = _extractAllDates(fullText);
  //   debugPrint('📅 All Detected Dates: $allDates');

  //   final extractedDate = selectInvoiceDate(allDates);
  //   debugPrint('📌 Selected Invoice Date: $extractedDate');

  //   setState(() {
  //     if (docType == DocumentType.deliveryChallan) {
  //       final deliveryChallan = extractDeliveryChallanNo(fullText);
  //       final plantCode =
  //           (deliveryChallan != null && deliveryChallan.length >= 4)
  //               ? deliveryChallan.substring(0, 4)
  //               : null;
        

  //       cubit.onValueChanged(
  //         deliveryChallanNo: deliveryChallan,
  //         invoiceDate: extractedDate,
  //         invoiceNo: null,
  //         plantCode: plantCode,
  //         sapNo: null,
  //       );
  //       debugPrint('✅ Delivery Challan processed');
  //       return;
  //     }
  //   });


    

  //   final tenDigitNumbers =
  //       getAllTenDigitNumbers(fullText, excludeHighStart: true);

  //   final invoiceNo = tenDigitNumbers.isNotEmpty ? tenDigitNumbers.first : null;
    

  //   String? plantCode;
  //   String? sapNo;

  //   if (invoiceNo != null && invoiceNo.length >= 4) {
  //     plantCode = invoiceNo.substring(0, 4);
  //     sapNo = plantCode; 
  //   }



  //   cubit.onValueChanged(
  //     invoiceNo: invoiceNo,
  //     sapNo: sapNo, 
  //     invoiceDate: extractedDate,
  //     deliveryChallanNo: null,
  //     plantCode: plantCode,
  //   );

  //   debugPrint('🧾 Invoice processed');
  //   debugPrint('📄 Invoice No: $invoiceNo');
  //   debugPrint('🔍 SAP No: $sapNo');
  //   debugPrint('📅 Date: $extractedDate');
  //   debugPrint('🏷️ Plant Code: $plantCode');

  //   return;
  // }

// ... rest of the file


  Future<void> extractTextFromImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final textRecognizer = TextRecognizer();

    final recognizedText = await textRecognizer.processImage(inputImage);
    final fullText = recognizedText.text;
    // final fullText = extractRowWiseText(recognizedText);

   


    debugPrint('📝 Extracted Text:\n$fullText');

    final docType = detectDocumentType(fullText);

    List<String> _extractAllDates(String text) {
      final patterns = [
        r'\b\d{2}[^0-9]{1,2}\d{2}[^0-9]{1,2}\d{4}\b',
        r'\b\d{2}(?:\.{1,2}|\s)\d{2}(?:\.{1,2}|\s)\d{4}\b',
        r'\b\d{2}\s\d{2}\s\d{4}\b',
      ];

      final dates = <String>[];

      for (var p in patterns) {
        dates.addAll(RegExp(p).allMatches(text).map((m) => m.group(0)!));
      }

      return dates;
    }

    String? selectInvoiceDate(List<String> dates) {
      if (dates.isEmpty) return null;

      if (dates.length == 1) {
        return dates.first;
      }

      return dates[1];
    }

    String? extractDeliveryChallanNo(String text) {
      final regex = RegExp(
        r'Delivery\s*Challan\s*Number\s*[:\-\s]*([\d]+)',
        caseSensitive: false,
      );
      return regex.firstMatch(text)?.group(1)?.trim() ??
          RegExp(r'\d{6,}').firstMatch(text)?.group(0);
    }

    List<String> getAllTenDigitNumbers(String text,
        {bool excludeHighStart = false}) {
      final regex = RegExp(r'\b\d{10}\b');
      return regex
          .allMatches(text)
          .map((m) => m.group(0)!)
          .where((num) => !excludeHighStart || num.startsWith(RegExp(r'[0-4]')))
          .toList();
    }

    final cubit = context.cubit<CreateGateEntryCubit>();

    final allDates = _extractAllDates(fullText);
    debugPrint('📅 All Detected Dates: $allDates');

    final extractedDate = selectInvoiceDate(allDates);
    debugPrint('📌 Selected Invoice Date: $extractedDate');

    // setState(() {
      if (docType == DocumentType.deliveryChallan) {
        final deliveryChallan = extractDeliveryChallanNo(fullText);
        final plantCode =
            (deliveryChallan != null && deliveryChallan.length >= 4)
                ? deliveryChallan.substring(0, 4)
                : null;

        cubit.onValueChanged(
          deliveryChallanNo: deliveryChallan,
          invoiceDate: extractedDate,
          invoiceNo: null,
          plantCode: plantCode,
          sapNo: null,
        );
        debugPrint('✅ Delivery Challan processed');
        return;
      }
    // });

    // final tenDigitNumbers =
    //     getAllTenDigitNumbers(fullText, excludeHighStart: true);

    // final invoiceNo = tenDigitNumbers.isNotEmpty ? tenDigitNumbers.first : null;
    // final sapNo = tenDigitNumbers.length > 1 ? tenDigitNumbers[1] : null;

    // final plantCode = (invoiceNo != null && invoiceNo.length >= 4)
    //     ? invoiceNo.substring(0, 4)
    //     : null;
    final tenDigitNumbers =
    getAllTenDigitNumbers(fullText, excludeHighStart: true);

String? invoiceNo;
String? sapNo;
if (tenDigitNumbers.isNotEmpty) {
  invoiceNo = tenDigitNumbers.first;

  final invoicePrefix = invoiceNo.substring(0, 4);

  final possibleSap = tenDigitNumbers.where(
    (num) => num != invoiceNo && num.startsWith(invoicePrefix),
  );

  sapNo = possibleSap.isNotEmpty ? possibleSap.first : null;
}

// if (tenDigitNumbers.isNotEmpty) {
//   invoiceNo = tenDigitNumbers.first;

//   final invoicePrefix = invoiceNo.substring(0, 4);


//   sapNo = tenDigitNumbers.firstWhere(
//     (num) => num != invoiceNo && num.startsWith(invoicePrefix),
  
//   );
// }
  final plantCode = (invoiceNo != null && invoiceNo.length >= 4)
        ? invoiceNo.substring(0, 4)
        : null;
sapNoController.text = sapNo ?? '';
invoiceNoController.text = invoiceNo ?? '';
plantCodeController.text = plantCode ?? '';
invoiceDateController.text = extractedDate ?? '';

    cubit.onValueChanged(
      invoiceNo: invoiceNo,
      sapNo: sapNo,
      invoiceDate: extractedDate,
      deliveryChallanNo: null,
      plantCode: plantCode,
    );

    debugPrint('🧾 Invoice processed');
    debugPrint('📄 Invoice No: $invoiceNo');
    debugPrint('🔍 SAP No: $sapNo');
    debugPrint('📅 Date: $extractedDate');
    debugPrint('🏷️ Plant Code: $plantCode');

    return;
  }
  
  
}
