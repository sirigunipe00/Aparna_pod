import 'dart:io';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/core/utils/attachment_selection_mixin.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/caption_text.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;

enum DocumentType { invoice, deliveryChallan }

DocumentType detectDocumentType(String text) {
  final t = text.toLowerCase().replaceAll(RegExp(r'\s+'), ' ');

  if (t.contains('delivery challan number') || t.contains('delivery challan')) {
    return DocumentType.deliveryChallan;
  }

  return DocumentType.invoice;
}

class PhotoSelectionWidget extends StatefulWidget {
  const PhotoSelectionWidget({
    super.key,
    this.title,
    this.isRequired = false,
    this.isReadOnly = false,
    this.imageUrl,
    this.defaultValue,
    required this.onFileCapture,
    this.focusNode,
    required this.fileName,
    this.isWarning,
    required this.borderColor,
    // required this.onReCrop,
    this.autoCropOnCapture = false,
  });

  final String? title;
  final String fileName;
  final bool isRequired;
  final String? imageUrl;
  final List<File>? defaultValue;
  final Function(List<File> files) onFileCapture;
  final bool isReadOnly;
  final FocusNode? focusNode;
  final bool? isWarning;
  final Color borderColor;
  // final Function(File oldFile, File newFile) onReCrop;
  final bool autoCropOnCapture;

  @override
  State<PhotoSelectionWidget> createState() => _PhotoSelectionWidgetState();
}

class _PhotoSelectionWidgetState extends State<PhotoSelectionWidget>
    with AttahcmentSelectionMixin {
  List<File> _selectedImages = [];

  @override
  void initState() {
    super.initState();

    if (widget.defaultValue.isNotNull && widget.defaultValue!.isNotEmpty) {
      _selectedImages = List<File>.from(widget.defaultValue!);
    }

    if (widget.imageUrl.isNotNull) {
      // keep existing view behavior
    }
  }

  @override
  void didUpdateWidget(covariant PhotoSelectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldList = oldWidget.defaultValue ?? const <File>[];
    final newList = widget.defaultValue ?? const <File>[];

    if (!listEquals(oldList, newList)) {
      if (newList.isEmpty) {
        setState(() {
          _selectedImages = [];
        });
      } else {
        setState(() {
          _selectedImages = List<File>.from(newList);
        });
      }
    }
  }

  // Future<void> _pickFromCamera() async {
  //   final file = await captureImage(); // from your mixin
  //   if (file == null) return;

  //   await _processSelectedFile(file);
  // }

  // Future<void> _pickFromGallery() async {
  //   final file = await selectImageFromGallery();
  //   if (file == null) return;

  //   await _processSelectedFile(file);
  // }
//   Future<void> _pickFromCamera() async {
//   while (true) {
//     final file = await captureImage();
//     if (file == null) break; // user cancelled camera

//     await _processSelectedFile(file);

//     // Auto open camera again unless 3+ images or read-only
//     if (widget.isReadOnly) break;
//   }
// }
  // Future<File?> _cropImageFile(File file) async {
  //   try {
  //     final result = await ImageCropper().cropImage(
  //       sourcePath: file.path,
  //       compressFormat: ImageCompressFormat.jpg,
  //       compressQuality: 95,
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Edit Image',
  //           toolbarColor: Colors.black,
  //           toolbarWidgetColor: Colors.white,
  //           statusBarColor: Colors.black,
  //           backgroundColor: Colors.white,
  //           activeControlsWidgetColor: Colors.blue,
  //           hideBottomControls: false,
  //           lockAspectRatio: false,
  //           showCropGrid: true,
  //         ),
  //         IOSUiSettings(
  //           title: 'Edit Image',
  //         ),
  //       ],
  //     );

  //     if (result == null) return null;

  //     return File(result.path);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  // Future<void> _pickFromGallery() async {
  //   final file = await selectImageFromGallery();
  //   if (file == null) return;

  //   // offer crop UI after selection
  //   final cropped = await _cropImageFile(file);
  //   final toProcess = cropped ?? file;
  //   await _processSelectedFile(toProcess);
  // }

  //  Future<void> _pickFromCamera() async {
  //   // Lock portrait while invoking camera/crop UI
  //   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   try {
  //     while (true) {
  //       final file = await captureImage();
  //       if (file == null) break;

  //       // normalize orientation first (optional)
  //       try {
  //         final bytes = await file.readAsBytes();
  //         final decoded = img.decodeImage(bytes);
  //         if (decoded != null) {
  //           final fixed = img.bakeOrientation(decoded);
  //           final out = img.encodeJpg(fixed, quality: 100);
  //           await file.writeAsBytes(out, flush: true);
  //         }
  //       } catch (_) {}

  //       // show cropper
  //       final cropped = await _cropImageFile(file);
  //       final toProcess = cropped ?? file;

  //       await _processSelectedFile(toProcess);

  //       if (widget.isReadOnly) break;
  //     }
  //   } finally {
  //     await SystemChrome.setPreferredOrientations([å
  //       DeviceOrientation.portraitUp,
  //       DeviceOrientation.portraitDown,
  //     ]);
  //   }
  // }
  // Future<void> _pickFromGallery() async {
  //   final file = await selectImageFromGallery();
  //   if (file == null) return;

  //   // ✂️ open crop right after choosing from gallery
  //   final cropped = await _cropImageFile(file);
  //   final toUse = cropped ?? file;

  //   await _processSelectedFile(toUse);
  // }
  Future<void> _pickFromCamera() async {
  try {
    final List<String>? pictures = await CunningDocumentScanner.getPictures(
      noOfPages: 5,
      isGalleryImportAllowed: false,
   
    );

    if (pictures == null || pictures.isEmpty) return;
    // File scannedFile = File(pictures.first);

    for (String path in pictures) {
      File scannedFile = File(path);

      // Fix orientation
      try {
        final bytes = await scannedFile.readAsBytes();
        final decoded = img.decodeImage(bytes);
        if (decoded != null) {
          final fixed = img.bakeOrientation(decoded);
          await scannedFile.writeAsBytes(img.encodeJpg(fixed, quality: 100));
        }
      } catch (_) {}

      // Add each scanned page
      await _processSelectedFile(scannedFile);
    }

  } catch (e) {
    debugPrint('Scanner Error: $e');
  }
}

//   Future<void> _pickFromCamera() async {
//   try {

//     final List<String>? pictures = await CunningDocumentScanner.getPictures(
//       noOfPages: 5,              
//       isGalleryImportAllowed: false,
//     );

//     if (pictures == null || pictures.isEmpty) return;

//     File scannedFile = File(pictures.first);


//     try {
//       final bytes = await scannedFile.readAsBytes();
//       final decoded = img.decodeImage(bytes);
//       if (decoded != null) {
//         final fixed = img.bakeOrientation(decoded);
//         await scannedFile.writeAsBytes(img.encodeJpg(fixed, quality: 100));
//       }
//     } catch (_) {}


//     await _processSelectedFile(scannedFile);

//   } catch (e) {
//     debugPrint("Scanner Error: $e");
//   }
// }


  // Future<void> _pickFromCamera() async {
  //   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //   try {
  //     final file = await captureImage();
  //     if (file == null) return;

  //     // orientation fix
  //     try {
  //       final bytes = await file.readAsBytes();
  //       final decoded = img.decodeImage(bytes);
  //       if (decoded != null) {
  //         final fixed = img.bakeOrientation(decoded);
  //         await file.writeAsBytes(img.encodeJpg(fixed, quality: 100));
  //       }
  //     } catch (_) {}

  //     final cropped = await _cropImageFile(file);
  //     if (cropped == null) return;

  //     await _processSelectedFile(cropped);
  //   } finally {
  //     await SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //       DeviceOrientation.portraitDown,
  //     ]);
  //   }
  // }

  // void _showImageSourcePicker() {
  //   FocusScope.of(context).unfocus();

  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (_) {
  //       return SafeArea(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.camera_alt),
  //               title: const Text("Capture from camera"),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _pickFromCamera();
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text("Upload from gallery"),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _pickFromGallery();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> _processSelectedFile(File file) async {
    final ext = path.extension(file.path);
    final dir = file.parent.path;

    // rename
    final renamedPath = path.join(
      dir,
      '${widget.fileName}_${DateTime.now().millisecondsSinceEpoch}$ext',
    );

    final renamedFile = await file.copy(renamedPath);

    // Auto-crop if enabled
    File finalFile = renamedFile;

    if (widget.autoCropOnCapture) {
      final cropped = await ImageCropper().cropImage(
        sourcePath: renamedPath,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
      );

      if (cropped != null) {
        finalFile = File(cropped.path);
      }
    }

    setState(() {
      _selectedImages.add(finalFile);
    });

    widget.onFileCapture(List<File>.from(_selectedImages));
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4,
      children: [
        if (widget.title.containsValidValue)
          CaptionText(
            title: widget.title!,
            isRequired: widget.isRequired,
          ),
        GestureDetector(
          onTap: () {
            if (widget.isReadOnly) {
              if (_selectedImages.isNotEmpty) {
                context.goToPage(
                  ImagePreviewPage(
                    title: widget.title ?? '',
                    images: _selectedImages,
                    initialIndex: 0,
                  ),
                );
              }
              return;
            }

            // _showImageSourcePicker();
          },
          child: _photoBox(),
        ),
      ],
    );
  }

  Widget _photoBox() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          if (!widget.isReadOnly)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _pickFromCamera,
                  icon: Icon(Icons.camera_alt, color: widget.borderColor),
                  tooltip: 'Capture from camera',
                ),
                // IconButton(
                //   onPressed: _pickFromGallery,
                //   icon: Icon(Icons.photo_library, color: widget.borderColor),
                //   tooltip: "Choose from gallery",
                // ),
              ],
            ),
          const SizedBox(height: 8),
          if (_selectedImages.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _selectedImages.map((img) {
                return GestureDetector(
                  onTap: () => context.goToPage(
                    ImagePreviewPage(
                      title: widget.title ?? '',
                      images: _selectedImages,
                      initialIndex: _selectedImages.indexOf(img),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(img,
                            height: 70, width: 70, fit: BoxFit.cover),
                      ),
                      if (!widget.isReadOnly)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            // onTap: () {
                            //   // setState(() {
                            //     _selectedImages.remove(img);
                            //     widget.onFileCapture(_selectedImages);
                            //     if (_selectedImages.isEmpty) {

                            //            context
                            //           .cubit<CreateGateEntryCubit>()
                            //           .onValueChanged(
                            //             invoiceNo: null,
                            //             sapNo: null,
                            //             invoiceDate: null,
                            //             deliveryChallanNo: null,
                            //             plantCode: null,
                            //           );

                            //     }
                            //   // });
                            // },
                            onTap: () {
                              setState(() {
                                _selectedImages.remove(img);
                              });

                              widget.onFileCapture(
                                  List<File>.from(_selectedImages));
                              if (_selectedImages.isEmpty) {
                                context
                                    .cubit<CreateGateEntryCubit>()
                                    .onValueChanged(
                                      invoiceNo: '',
                                      sapNo: '',
                                      invoiceDate: '',
                                      deliveryChallanNo: '',
                                      plantCode: '',
                                      remarks: '',
                                    );
                              }
                            },
                            child: Container(
                              color: Colors.black54,
                              child: const Icon(Icons.close,
                                  color: Colors.white, size: 16),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}

class ImagePreviewPage extends StatefulWidget {

  const ImagePreviewPage({
    super.key,
    required this.images,
    required this.initialIndex,
    required this.title,
  });
  final String title;
  final List<File> images;
  final int initialIndex;

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  PageController? _controller;
  double angle = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.vibrantBlue,
        onPressed: () => setState(() => angle += 1.5708),
        child: const Icon(Icons.rotate_right),
      ),
      body: PageView.builder(
        controller: _controller!,
        itemCount: widget.images.length,
        itemBuilder: (_, i) {
          return Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 5.0,
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  clipBehavior: Clip.none,
                  child: Transform.rotate(
                    angle: angle,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.file(widget.images[i]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
