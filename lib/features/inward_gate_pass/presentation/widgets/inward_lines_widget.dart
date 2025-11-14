import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/cubit/create_inward_cubit.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GatePassInLinesWidget extends StatefulWidget {
  final List<ItemsForm> lines;
  final Function(List<ItemsForm> newlines) onItems;

  const GatePassInLinesWidget({
    super.key,
    required this.lines,
    required this.onItems,
  });

  @override
  State<GatePassInLinesWidget> createState() => _GatePassInLinesWidgetState();
}

class _GatePassInLinesWidgetState extends State<GatePassInLinesWidget> {
  late TextEditingController quantityController;
  late List<ItemsForm> itemLines;
  List<int> selectedRows = [];
  bool isEditing = false;
  int? editingRowIndex;

  @override
  void initState() {
    super.initState();
    itemLines = List.from(widget.lines);
    quantityController = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant GatePassInLinesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lines != widget.lines) {
      setState(() {
        itemLines = List.from(widget.lines);
      });
    }
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CreateInwardCubit, CreateInwardState>(
      builder: (_, state) {
        final isDraft =
            state.form.docstatus == null || state.form.docstatus == 0;
        final iscreation = state.form.docstatus == null;

        return BlocBuilder<InwardLinesCubit, InwardLinesCubitState>(
          builder: (context, lineState) {
            final cubitLines = lineState.maybeWhen(
              success: (data) => data,
              orElse: () => <ItemsForm>[],
            );

            if (itemLines.isEmpty) {
              itemLines = List.from(cubitLines);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: screenWidth),
                    child: DataTable(
                      key: ValueKey(itemLines.length),
                      headingTextStyle: const TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      dataTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: AppColors.subtitlecolor,
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFF1F1F1)),
                      border: TableBorder.all(color: const Color(0xFF808080)),
                      headingRowColor:
                          WidgetStateProperty.all(AppColors.marigoldDDust),
                      columns: _buildDataColumns(isDraft),
                      columnSpacing: 30,
                      headingRowHeight: 30,
                      horizontalMargin: 30,
                      rows: _buildDataRows(context, isDraft, iscreation),
                    ),
                  ),
                ),
                if (selectedRows.isNotEmpty) _buildDeleteButton(context),
              ],
            );
          },
        );
      },
    );
  }

  List<DataColumn> _buildDataColumns(bool isDraft) {
    return [
      if (isDraft)
        DataColumn(
          label: Checkbox(
            value:
                itemLines.isNotEmpty && selectedRows.length == itemLines.length,
            onChanged: (value) {
              setState(() {
                selectedRows = value == true
                    ? List.generate(itemLines.length, (index) => index)
                    : [];
              });
            },
          ),
        ),
      const DataColumn(label: Center(child: Text('Is Manual Item.'))),
      const DataColumn(label: Center(child: Text('Manual Item Code'))),
      const DataColumn(label: Center(child: Text('Manual Item Name'))),
      const DataColumn(label: Center(child: Text('Item Code'))),
      const DataColumn(label: Center(child: Text('Item Name'))),
      const DataColumn(label: Center(child: Text('Quantity.'))),
      const DataColumn(label: Center(child: Text('UOM'))),
      const DataColumn(label: Center(child: Text('Value'))),
      const DataColumn(label: Center(child: Text('Exp.Date'))),
      const DataColumn(label: Center(child: Text('Edit'))),
    ];
  }

  List<DataRow> _buildDataRows(
      BuildContext context, bool isDraft, bool iscreation) {
    return List.generate(itemLines.length, (index) {
      final isRowEditing = editingRowIndex == index;

      if (isRowEditing) {
        quantityController.text = itemLines[index].pendingQty?.toString() ?? '';
      }

      return DataRow(
        cells: [
          if (isDraft)
            DataCell(
              Checkbox(
                value: selectedRows.contains(index),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selectedRows.add(index);
                    } else {
                      selectedRows.remove(index);
                    }
                  });
                },
              ),
            ),
          DataCell(
            Checkbox(
              value: (itemLines[index].isManualItem ?? 0) == 1,
              onChanged: null,
            ),
          ),
          DataCell(Text(itemLines[index].manualItemCode ?? '')),
          DataCell(Text(itemLines[index].manualItemName ?? '')),
          DataCell(Text(itemLines[index].itemCode ?? '')),
          DataCell(Text(itemLines[index].itemName ?? '')),
          DataCell(
            isRowEditing
                ? TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: 'Enter Quantity'),
                    onSubmitted: (value) =>
                        _onQuantitySubmitted(context, value, index, iscreation),
                  )
                : Text(
                    iscreation
                        ? (itemLines[index].pendingQty?.toString() ??
                            '0') // Show pendingQty if iscreation
                        : (itemLines[index].quantity?.toString() ??
                            '0'), // Show quantity otherwise
                  ),
          ),
          DataCell(Text(itemLines[index].uom ?? '')),
          DataCell(Text(itemLines[index].value?.toString() ?? '')),
          DataCell(Text(itemLines[index].expiryDate ?? '')),
          DataCell(
            IconButton(
              icon: Icon(isRowEditing ? Icons.check : Icons.edit),
              onPressed: () => _toggleEditMode(index, iscreation),
            ),
          ),
        ],
      );
    });
  }

  void _onQuantitySubmitted(
      BuildContext context, String value, int index, bool iscreation) {
    final newValue = double.tryParse(value);

    if (newValue != null) {
      final previousValue = iscreation
          ? (itemLines[index].pendingQty ?? 0)
          : (itemLines[index].quantity ?? 0);

      if (newValue > previousValue) {
        _showInvalidQuantityDialog(context);
        return;
      }

      setState(() {
        itemLines[index] = itemLines[index].copyWith(
          quantity: newValue, // Always update the quantity field
        );

        if (iscreation) {
          itemLines[index] = itemLines[index].copyWith(
            pendingQty: newValue, // Update pendingQty when iscreation is true
          );
        }

        editingRowIndex = null;
      });

      context
          .read<CreateInwardCubit>()
          .onFieldValueChanged(items: List.from(itemLines));
    } else {
      _showInvalidQuantityDialog(context);
    }
  }

  void _toggleEditMode(int index, bool iscreation) {
    setState(() {
      if (editingRowIndex == index) {
        // When editing is done, update the correct field
        final newValue = double.tryParse(quantityController.text) ?? 0.0;
        itemLines[index] = itemLines[index].copyWith(
          quantity: newValue, // Always update the quantity field
        );
        editingRowIndex = null;
      } else {
        // When entering edit mode, set the initial value in the text field
        editingRowIndex = index;
        quantityController.text = iscreation
            ? (itemLines[index].pendingQty?.toString() ?? '')
            : (itemLines[index].quantity?.toString() ?? '');
      }
    });
  }

  void _showInvalidQuantityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Invalid Quantity',
          style: TextStyle(color: Colors.black),
        ),
        content: const Text(
          'Inward Quantity Cannot Exceed Outward Quantity.',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'OK',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    final isDraftD = context.read<CreateInwardCubit>().state;
    final toDelete = isDraftD.form.docstatus;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        visualDensity: const VisualDensity(vertical: -2),
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        final remainingItems = itemLines.length - selectedRows.length;

        if (remainingItems <= 0 && toDelete.isNotNull) {
          AppDialog.showErrorDialog(
            context,
            content: 'At least One Item is Required',
            onTapDismiss: context.exit,
            title: 'Error',
          ).then(
            (value) {
              setState(() {
                selectedRows.clear();
              });
            },
          );
        } else {
          setState(() {
            itemLines = itemLines
                .asMap()
                .entries
                .where((entry) {
                  return !selectedRows.contains(entry.key);
                })
                .map((entry) => entry.value)
                .toList();

            selectedRows.clear();
          });
          context
              .read<CreateInwardCubit>()
              .onFieldValueChanged(items: List.from(itemLines));
        }
        setState(() {});
      },
      child: const Text('Delete'),
    );
  }
}
