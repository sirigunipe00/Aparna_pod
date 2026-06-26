import 'dart:io';
import 'package:aparna_pod/widgets/buttons/app_btn.dart';
import 'package:flutter/material.dart';

class InvoicePreviewScreen extends StatelessWidget {

  const InvoicePreviewScreen({
    super.key,
    required this.files,
    required this.onConfirm,
    required this.onCancel,
  });
  final List<File> files;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoice Preview',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: files.isEmpty
                ? const Center(
                    child: Text(
                      'No invoice image found',
                    ),
                  )
                : ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            files[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Cancel',
                    bgColor: Colors.red,
                    onPressed: () {
                      onCancel();

                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    label: 'Confirm',
                    onPressed: () {
                      onConfirm();

                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}