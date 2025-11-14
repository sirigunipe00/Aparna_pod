import 'package:aparna_pod/features/gate_entry/model/material_name_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/uom_list_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/cubit/create_outward_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OutwardLinesWidget extends StatefulWidget {
  final Function(List<ItemsForm> lines) oncall;
  const OutwardLinesWidget({super.key, required this.oncall});

  @override
  State<OutwardLinesWidget> createState() => _OutwardLinesWidgetState();
}

class _OutwardLinesWidgetState extends State<OutwardLinesWidget> {
  List<ItemsForm> itemLines = <ItemsForm>[];
  List<int> selectedRows = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CreateOutwardCubit, CreateOutwardState>(
      builder: (_, state) {
        final isDraft =
            state.form.docstatus == null || state.form.docstatus == 0;
        return BlocListener<OutwardLinesCubit, OutwardLinesCubitState>(
            listener: (context, linesstate) {
              final list = linesstate.maybeWhen(
                orElse: () => <ItemsForm>[],
                success: (data) {
                  return data;
                },
              );
              itemLines.addAll(list);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: screenWidth),
                    child: DataTable(
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
                          WidgetStateProperty.all(AppColors.shyMoment),
                      columns: [
                        if (isDraft) ...[
                          DataColumn(
                            label: Checkbox(
                              value: itemLines.isNotEmpty &&
                                  selectedRows.length == itemLines.length,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedRows
                                      ..clear()
                                      ..addAll(List.generate(
                                          itemLines.length, (index) => index));
                                  } else {
                                    selectedRows.clear();
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                        const DataColumn(
                            label: Center(child: Text('Is Manual Item'))),
                        const DataColumn(
                            label: Center(child: Text('Manual Item Code'))),
                        const DataColumn(
                            label: Center(child: Text('Manual Item Name'))),
                        const DataColumn(
                            label: Center(child: Text('Item Code'))),
                        const DataColumn(
                            label: Center(child: Text('Item Name'))),
                        const DataColumn(
                            label: Center(child: Text('Quantity'))),
                        const DataColumn(label: Center(child: Text('UOM'))),
                        const DataColumn(label: Center(child: Text('Value'))),
                        const DataColumn(
                            label: Center(child: Text('Exp. Date'))),
                      ],
                      columnSpacing: 30,
                      headingRowHeight: 30,
                      horizontalMargin: 30,
                      rows: List.generate(itemLines.length, (index) {
                        return DataRow(
                          cells: [
                            if (isDraft) ...[
                              DataCell(
                                Checkbox(
                                  value: selectedRows.contains(index),
                                  onChanged: (value) {
                                    if (selectedRows.contains(index)) {
                                      setState(() {
                                        selectedRows.remove(index);
                                      });
                                    } else {
                                      setState(() {
                                        selectedRows.add(index);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                            DataCell(
                              Checkbox(
                                value:
                                    (itemLines[index].isManualItem ?? 0) == 1,
                                onChanged: null,
                              ),
                            ),
                            DataCell(
                                Text(itemLines[index].manualItemCode ?? '')),
                            DataCell(
                                Text(itemLines[index].manualItemName ?? '')),
                            DataCell(Text(itemLines[index].itemCode ?? '')),
                            DataCell(Text(itemLines[index].itemName ?? '')),
                            DataCell(
                                Text(itemLines[index].quantity.toString())),
                            DataCell(Text(itemLines[index].uom ?? '')),
                            DataCell(Text(itemLines[index].value.toString())),
                            DataCell(Text(itemLines[index].expiryDate ?? '')),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (selectedRows.isNotEmpty)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      visualDensity: const VisualDensity(vertical: -2),
                      backgroundColor: Colors.red[300],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      final cubit = context.read<CreateOutwardCubit>();

                      final rowsToDelete = List.of(selectedRows)
                        ..sort((a, b) => b.compareTo(a));

                      for (final index in rowsToDelete) {
                        setState(() {
                          itemLines.removeAt(index);
                          selectedRows.clear();
                        });
                      }

                      cubit.onFieldValueChanged(items: List.from(itemLines));
                    },
                    child: const Text('Delete'),
                  ),
                AppSpacer.p4(),
                if (state.form.docstatus != 1) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      visualDensity: const VisualDensity(vertical: -2),
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _showAddItemDialog(
                      context,
                      itemLines,
                      (items) {
                        setState(() {
                          itemLines = items;
                          widget.oncall(itemLines);
                        });
                      },
                    ),
                    child: const Text('Add Items'),
                  ),
                ],
              ],
            ));
      },
    );
  }

  void _showAddItemDialog(BuildContext context, List<ItemsForm> itemLines,
      final Function(List<ItemsForm> items) onChanged) {
    showDialog(
      context: context,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<CreateOutwardCubit>()),
            BlocProvider.value(value: context.read<MaterialNameList>()),
            BlocProvider.value(value: context.read<UomListCubit>()),
          ],
          child: AddItemLinesWidget(
            itemLines: itemLines,
            onChanged: (items) {
              onChanged(items);
            },
          ),
        );
      },
    );
  }
}

class AddItemLinesWidget extends StatefulWidget {
  final List<ItemsForm> itemLines;
  final Function(List<ItemsForm> items) onChanged;

  const AddItemLinesWidget(
      {super.key, required this.itemLines, required this.onChanged});

  @override
  State<AddItemLinesWidget> createState() => _AddItemLinesWidgetState();
}

class _AddItemLinesWidgetState extends State<AddItemLinesWidget> {
  final _formKey = GlobalKey<FormState>();
  final itemCode = TextEditingController();
  final itemName = TextEditingController();
  final manualItemCode = TextEditingController();
  final quantity = TextEditingController();
  final uom = TextEditingController();
  final manualItemName = TextEditingController();
  final value = TextEditingController();
  final expiryDate = TextEditingController();
  bool ismanualItem = false;

  late List<ItemsForm> itemlines = <ItemsForm>[];

  @override
  void initState() {
    itemlines = List.from(widget.itemLines);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Outward Gate Pass Items'),
      content: SizedBox(
        width: context.sizeOfHeight,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SpacedColumn(
              defaultHeight: 10.0,
              children: [
                CheckboxListTile(
                  value: ismanualItem,
                  onChanged: (value) {
                    setState(() {
                      ismanualItem = !ismanualItem;
                    });
                  },
                  activeColor: Colors.black,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  isThreeLine: false,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const CaptionText(
                      title: 'Is Manual Item', isRequired: false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                if (!ismanualItem) ...[
                  BlocBuilder<MaterialNameList, MaterialNameListState>(
                    builder: (_, state) {
                      final names = state.maybeWhen(
                        orElse: () => <MaterialNameForm>[],
                        success: (data) => data,
                      );
                      return SearchDropDownList(
                          color: AppColors.shyMoment,
                          items: names,
                          isMandatory: true,
                          key: ValueKey(names),
                          title: 'itemCode',
                          isloading: state.isLoading,
                          futureRequest: (p0) async {
                            final where = names.where((e) {
                              final strList = [e.itemName, e.description, e.uom]
                                  .nonNulls
                                  .toList();
                              return strList
                                  .caseInsensitiveSearch(p0, (str) => str)
                                  .isNotEmpty;
                            });

                            return where.toList();
                          },
                          headerBuilder: (_, item, __) => Text(item.name ?? ''),
                          listItemBuilder: (_, item, __, ___) =>
                              CompactListTile(
                                title: item.name!,
                                subtitle: item.itemName,
                              ),
                          onSelected: (names) {
                            setState(() {
                              itemCode.text = names.name.valueOrEmpty;
                              itemName.text = names.itemName!;
                              uom.text = names.uom!;
                            });
                          });
                    },
                  ),
                  InputField(
                    borderColor: AppColors.shyMoment,
                    readOnly: true,
                    title: 'Item Name',
                    isRequired: false,
                    inputType: TextInputType.text,
                    controller: itemName,
                    validator: (p0) {
                      if (p0.doesNotHaveValue) return 'Enter Item Name';
                      return null;
                    },
                  ),
                ] else ...[
                  InputField(
                    borderColor: AppColors.shyMoment,
                    title: 'Manual Item Code',
                    isRequired: false,
                    inputType: TextInputType.text,
                    controller: manualItemCode,
                    validator: (p0) {
                      if (p0.doesNotHaveValue) return 'Enter Manual Item Code';
                      return null;
                    },
                  ),
                  InputField(
                    borderColor: AppColors.shyMoment,
                    title: 'Manual Item Name',
                    isRequired: false,
                    inputType: TextInputType.text,
                    controller: manualItemName,
                    validator: (p0) {
                      if (p0.doesNotHaveValue) return 'Enter Manual Item Name';
                      return null;
                    },
                  ),
                ],
                InputField(
                  borderColor: AppColors.shyMoment,
                  title: 'Quantity',
                  isRequired: true,
                  inputType: TextInputType.number,
                  controller: quantity,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(
                        r'^\d*\.?\d*$')), // Allow numbers and a single decimal point
                  ],
                  validator: (p0) {
                    if (p0.doesNotHaveValue) return 'Enter Quanity';
                    return null;
                  },
                ),
                if (!ismanualItem) ...[
                  InputField(
                    borderColor: AppColors.shyMoment,
                    title: 'UOM',
                    readOnly: true,
                    controller: uom,
                    isRequired: true,
                    validator: (p0) {
                      if (p0.doesNotHaveValue) return 'Enter UOM';
                      return null;
                    },
                  ),
                ] else ...[
                  BlocBuilder<UomListCubit, UomListCubitState>(
                    builder: (_, state) {
                      final names = state.maybeWhen(
                        orElse: () => <UomListForm>[],
                        success: (data) {
                          return data;
                        },
                      );
                      return SearchDropDownList(
                          color: AppColors.shyMoment,
                          items: names,
                          isMandatory: true,
                          hint: 'Select UOM',
                          key: ValueKey(names),
                          title: 'UOM',
                          isloading: state.isLoading,
                          futureRequest: (p0) async {
                            final where = names.where((e) {
                              final strList = [e.name].nonNulls.toList();
                              return strList
                                  .caseInsensitiveSearch(p0, (str) => str)
                                  .isNotEmpty;
                            });

                            return where.toList();
                          },
                          headerBuilder: (_, item, __) => Text(item.name),
                          listItemBuilder: (_, item, __, ___) =>
                              CompactListTile(
                                title: item.name,
                              ),
                          onSelected: (names) {
                            setState(() {
                              uom.text = names.name;
                            });
                          });
                    },
                  ),
                ],
                InputField(
                  borderColor: AppColors.shyMoment,
                  title: 'Value',
                  isRequired: true,
                  inputType: TextInputType.number,
                  controller: value,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
                  validator: (p0) {
                    if (p0.doesNotHaveValue) return 'Enter Value';
                    return null;
                  },
                ),
                DateSelectionField(
                  firstDate: DFU.now(),
                  lastDate: DFU.now().add(const Duration(days: 184)),
                  onDateSelect: (date) {
                    final dateString = DateFormat('yyyy-MM-dd').format(date);
                    setState(() {
                      expiryDate.text = dateString;
                    });
                  },
                  initialValue: expiryDate.text,
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  title: 'Expiry Date',
                  isRequired: true,
                  readOnly: false,
                  borderColor: AppColors.shyMoment,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: context.exit,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.shyMoment),
          onPressed: () {
            // if (!uom.text.containsValidValue) {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: const Text('Invalid Input'),
            //         content: const Text('Please select UOM'),
            //         actions: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.of(context).pop();
            //             },
            //             child: const Text('OK'),
            //           ),
            //         ],
            //       );
            //     },
            //   );
            // }
            //  else {
              final validate = _formKey.currentState?.validate();
              if (validate.isTrue) {
                final newItem = ItemsForm(
                  expiryDate: expiryDate.text,
                  isManualItem: ismanualItem ? 1 : 0,
                  itemCode: itemCode.text,
                  itemName: itemName.text,
                  manualItemCode: manualItemCode.text,
                  manualItemName: manualItemName.text,
                  quantity: double.tryParse(quantity.text),
                  uom: uom.text,
                  value: double.tryParse(value.text),
                );

                itemlines.add(newItem);

                widget.onChanged(List.from(itemlines));

                final validate = _formKey.currentState?.validate();

                if (validate.isTrue) {
                
                  context
                    ..cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(items: List.from(itemlines))
                    ..exit();
                }
              }
            },
          // },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
