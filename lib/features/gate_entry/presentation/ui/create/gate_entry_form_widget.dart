import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/widgets/document_preview.dart';
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
    final loggedInUser = context.user;
    print('loggedInUser$loggedInUser');

    final isSuperUser =
        loggedInUser.roleProfile?.contains('POD Invoice Super User') ?? false;
    print('............$isSuperUser');
    final formState = context.watch<CreateGateEntryCubit>().state;
    final isCompleted = formState.view == GateEntryView.completed;
    final newform = formState.form;

    $logger.devLog('form..............$newform');
    final now = DateTime.now();

    final financialYearStart = now.month >= 4
        ? DateTime(now.year, 4, 1)
        : DateTime(now.year - 1, 4, 1);

    final financialYearEnd = now.month >= 4
        ? DateTime(now.year + 1, 3, 31)
        : DateTime(now.year, 3, 31);

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
                  key: ValueKey(
                    state.form.invoiceFiles?.isEmpty ?? true,
                  ),
                  defaultValue: files,
                  title: 'Invoice Photos',
                  isReadOnly: !state.isNew,
                  onFileCapture: (capturedFiles) async {
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
                      // Process images one by one; stop as soon as one succeeds
                      for (final f in updatedList) {
                        final success = await extractTextFromImage(f.path);
                        if (success) break;
                      }
                    }
                  },
                );
              },
            ),

            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                return InputField(
                  readOnly: !isSuperUser,
                  // key: UniqueKey(),
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
                  readOnly: !isSuperUser,
                  // key: UniqueKey(),
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
                  readOnly: !isSuperUser,
                  // key: UniqueKey(),
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
            DateSelectionField(
              firstDate: financialYearStart,
              lastDate: financialYearEnd,
              readOnly: !isSuperUser,
              // key: UniqueKey(),
              // controller: invoiceDateController,
              key: ValueKey(newform.invoiceDate),

              initialValue: (() {
                final dateStr = newform.invoiceDate;
                if (dateStr == null || dateStr.isEmpty) return null;
                final parsed = DateTime.tryParse(dateStr);
                return parsed != null ? DFU.ddMMyyyy(parsed) : dateStr;
              })(),

              onDateSelect: (p0) {
                final formattedDate = "${p0.day.toString().padLeft(2, '0')}."
                    "${p0.month.toString().padLeft(2, '0')}."
                    "${p0.year}";
                // setState(() {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(invoiceDate: formattedDate);
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
                  readOnly: !isSuperUser,
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
                      final cubit = context.cubit<CreateGateEntryCubit>();
                      print('state.view ....:${state.view.name}');

                      if (state.view == GateEntryView.create) {
                        final files = state.form.invoiceFiles ?? [];

                        if (files.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please scan a document first'),
                            ),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InvoicePreviewScreen(
                              files: state.form.invoiceFiles ?? [],
                              onCancel: () {
                                cubit.onValueChanged(
                                  invoiceNo: '',
                                  sapNo: '',
                                  invoiceFiles: [],
                                  invoiceDate: '',
                                  deliveryChallanNo: '',
                                  plantCode: '',
                                );
                                setState(() {
                                  invoiceNoController.clear();
                                  sapNoController.clear();
                                  invoiceDateController.clear();
                                  deliveryChallanController.clear();
                                  plantCodeController.clear();
                                });
                              },
                              onConfirm: () {
                                context.cubit<CreateGateEntryCubit>().save();
                              },
                            ),
                          ),
                        );
                      } else {
                        context.cubit<CreateGateEntryCubit>().save();
                      }
                    });

                // return AppButton(
                //     label: state.view.toName(),
                //     isLoading: state.isLoading,
                //     bgColor: AppColors.haintBlue,
                //     margin: const EdgeInsets.all(12.0),
                //     onPressed: () {
                //       context.cubit<CreateGateEntryCubit>().save();
                //     });
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

  Future<bool> extractTextFromImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final textRecognizer = TextRecognizer();

    final recognizedText = await textRecognizer.processImage(inputImage);
    final fullText = recognizedText.text;
    // final fullText = extractRowWiseText(recognizedText);

    // debugPrint('📝 Extracted Text:\n$fullText');

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

      final now = DateTime.now();

      // Financial year logic
      // Example:
      // Apr 2025 - Mar 2026
      final fyStartYear = now.month >= 4 ? now.year : now.year - 1;
      final fyEndYear = fyStartYear + 1;

      DateTime? validDate;

      for (final rawDate in dates) {
        try {
          // Normalize separators
          final cleaned = rawDate.replaceAll(RegExp(r'[^0-9]'), '/');

          final parts = cleaned.split('/');

          if (parts.length != 3) continue;

          final day = int.tryParse(parts[0]);
          final month = int.tryParse(parts[1]);
          final year = int.tryParse(parts[2]);

          if (day == null || month == null || year == null) continue;

          // Reject impossible OCR years
          if (year < fyStartYear || year > fyEndYear) {
            debugPrint('❌ Rejected invalid OCR year: $year');
            continue;
          }

          // Basic validation
          if (month < 1 || month > 12) continue;
          if (day < 1 || day > 31) continue;

          final parsed = DateTime(year, month, day);

          if (parsed.isAfter(now)) {
            debugPrint('❌ Future date rejected: $parsed');
            continue;
          }

          validDate = parsed;
          break;
        } catch (_) {
          continue;
        }
      }

      if (validDate == null) return null;

      return "${validDate.day.toString().padLeft(2, '0')}."
          "${validDate.month.toString().padLeft(2, '0')}."
          "${validDate.year}";
    }

    // String? selectInvoiceDate(List<String> dates) {
    //   if (dates.isEmpty) return null;

    //   if (dates.length == 1) {
    //     return dates.first;
    //   }

    //   return dates[1];
    // }

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

    if (docType == DocumentType.deliveryChallan) {
      final deliveryChallan = extractDeliveryChallanNo(fullText);
      final plantCode = (deliveryChallan != null && deliveryChallan.length >= 4)
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
      return true; // success — stop processing more images
    }

    final tenDigitNumbers =
        getAllTenDigitNumbers(fullText, excludeHighStart: true);

    final twelveDigitRegex = RegExp(r'\b\d{12}\b');
    final twelveDigitNumbers =
        twelveDigitRegex.allMatches(fullText).map((m) => m.group(0)!).toList();

    debugPrint('🔢 10-digit numbers: $tenDigitNumbers');
    debugPrint('🔢 12-digit numbers: $twelveDigitNumbers');

    String? invoiceNo;
    String? sapNo;
    String? plantCode;

    if (twelveDigitNumbers.isNotEmpty) {
      invoiceNo = twelveDigitNumbers.first;
      final trimmedInvoice = invoiceNo.substring(2);
      final sapMatchPrefix = trimmedInvoice.substring(0, 4);
      debugPrint(
          '🔎 Invoice: $invoiceNo | Trimmed: $trimmedInvoice | SAP prefix: $sapMatchPrefix');
      final possibleSap = tenDigitNumbers.where(
        (num) => num.startsWith(sapMatchPrefix),
      );
      sapNo = possibleSap.isNotEmpty ? possibleSap.first : null;
      plantCode = sapMatchPrefix;
    } else if (tenDigitNumbers.isNotEmpty) {
      invoiceNo = tenDigitNumbers.first;
      final trimmedInvoice =
          invoiceNo.length > 2 ? invoiceNo.substring(2) : invoiceNo;
      final sapMatchPrefix = trimmedInvoice.length >= 4
          ? trimmedInvoice.substring(0, 4)
          : trimmedInvoice;
      final possibleSap = tenDigitNumbers.where(
        (num) => num != invoiceNo && num.startsWith(sapMatchPrefix),
      );
      sapNo = possibleSap.isNotEmpty ? possibleSap.first : null;
      plantCode = sapMatchPrefix;
    }

    // Nothing useful extracted — try the next image
    if (invoiceNo == null && extractedDate == null) {
      debugPrint('⚠️ Nothing extracted from this image, trying next...');
      return false;
    }

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
// await textRecognizer.close();
    return true; // success — stop processing more images
  }
}
