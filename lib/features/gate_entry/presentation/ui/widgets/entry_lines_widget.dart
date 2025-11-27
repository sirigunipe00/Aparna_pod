
// import 'package:aparna_pod/features/gate_entry/model/material_name_form.dart';
// import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
// import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
// import 'package:aparna_pod/styles/app_colors.dart';
// import 'package:aparna_pod/core/core.dart';
// import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
// import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
// import 'package:aparna_pod/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class GateEntryLinesWidget extends StatefulWidget {
//   const GateEntryLinesWidget({super.key});

//   @override
//   State<GateEntryLinesWidget> createState() => _GateEntryLinesWidgetState();
// }

// class _GateEntryLinesWidgetState extends State<GateEntryLinesWidget> {
//   List<int> selectedRows = [];
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
//       builder: (_, state) {
//         final isDraft= state.form.docStatus == null || state.form.docStatus == 0;
//         final itemLines = state.lines;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(minWidth: screenWidth),
//                 child: DataTable(
//                   headingTextStyle: const TextStyle(
//                     fontSize: 12,
//                     color: AppColors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   dataTextStyle: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1,
//                     color: AppColors.subtitlecolor,
//                   ),
//                   decoration: const BoxDecoration(color: Color(0xFFF1F1F1)),
//                   border: TableBorder.all(color: const Color(0xFF808080)),
//                   headingRowColor:
//                       WidgetStateProperty.all(AppColors.marigoldDDust),
//                   columns: [
//                     if(isDraft)...[
//                         DataColumn(
//                       label: Checkbox(
//                         value: itemLines.isNotEmpty && selectedRows.length == itemLines.length,
//                         onChanged: (value) {
//                           setState(() {
                            
//                             if (value == true){
//                               selectedRows..clear()..addAll(List.generate(itemLines.length, (index) => index));
//                             } else {
//                               selectedRows.clear();
//                             }
//                           });

//                         },
//                       ),
//                     ),

//                     ],
                  
//                     const DataColumn(
//                         label: Center(child: Text('Material Name'))),
//                     const DataColumn(label: Center(child: Text('Serial No.'))),
//                     const DataColumn(label: Center(child: Text('Asset No.'))),
//                     const DataColumn(label: Center(child: Text('Qty.'))),
//                     const DataColumn(label: Center(child: Text('UOM'))),
//                     const DataColumn(label: Center(child: Text('Amount'))),
//                   ],
//                   columnSpacing: 30,
//                   headingRowHeight: 30,
//                   horizontalMargin: 30,
//                   rows: List.generate(itemLines.length, (index) {
//                     return DataRow(
//                       cells: [
//                         if(isDraft)...[
//                           DataCell(
//                           Checkbox(
//                             value: selectedRows.contains(index),
//                             onChanged: (value) {
//                               if (selectedRows.contains(index)){
//                                 setState(() {
//                                   selectedRows.remove(index);
//                                 });
//                               } else {
//                                 setState(() {
//                                   selectedRows.add(index);
//                                 });
//                               }
//                             },
//                           ),
//                         ),

//                         ],
                        
//                         DataCell(Text(itemLines[index].materialName ?? '')),
//                         DataCell(Text(itemLines[index].serialNumber ?? '')),
//                         DataCell(Text(itemLines[index].assetNumber == null
//                             ? ''
//                             : itemLines[index].assetNumber.toString())),
//                         DataCell(Text(itemLines[index].quantity.toString())),
//                         DataCell(Text(itemLines[index].oums ?? '')),
//                         DataCell(Text(itemLines[index].amount.toString())),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             AppSpacer.p4(),
//             if (selectedRows.isNotEmpty)
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   visualDensity: const VisualDensity(vertical: -2),
//                   backgroundColor: Colors.red[300],
//                   foregroundColor: Colors.white,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   textStyle: const TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   final cubit = context.read<CreateGateEntryCubit>();
//                   for (final index in selectedRows){
//                    final i= selectedRows.elementAt(index);
//                     cubit.removeLineAt(i);
//                   }

//                   setState(() {
//                     selectedRows.clear();
//                   });
//                 },
//                 child: const Text('Delete'),
//               ),
//             if (state.form.docStatus != 1) ...[
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   visualDensity: const VisualDensity(vertical: -2),
//                   backgroundColor: Colors.grey[300],
//                   foregroundColor: Colors.black,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   textStyle: const TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () => _showAddItemDialog(context),
//                 child: const Text('Add Items'),
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }

//   void _showAddItemDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return MultiBlocProvider(
//           providers: [
//             BlocProvider.value(value: context.read<CreateGateEntryCubit>()),
//             BlocProvider.value(value: context.read<MaterialNameList>()),
//           ],
//           child: const AlertDialogWidget(),
//         );
//       },
//     );
//   }
// }

// class AlertDialogWidget extends StatefulWidget {
//   const AlertDialogWidget({super.key});

//   @override
//   State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
// }

// class _AlertDialogWidgetState extends State<AlertDialogWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final materialName = TextEditingController();
//   final serialNumber = TextEditingController();
//   final assetNumber = TextEditingController();
//   final quantity = TextEditingController();
//   final uom = TextEditingController();
//   final amount = TextEditingController();
//   final description = TextEditingController();
//   bool isreturn = false;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Add Item Details'),
//       content: SizedBox(
//         width: context.sizeOfHeight,
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: SpacedColumn(
//               defaultHeight: 10.0,
//               children: [
//                 BlocBuilder<MaterialNameList, MaterialNameListState>(
//                   builder: (_, state) {
//                     final names = state.maybeWhen(
//                       orElse: () => <MaterialNameForm>[],
//                       success: (data) => data,
//                     );
//                     return SearchDropDownList(
//                         color: AppColors.marigoldDDust,
//                         items: names,
//                         key: ValueKey(names),
//                         isMandatory: true,
//                         title: 'Material Name',
//                         isloading: state.isLoading,
//                         futureRequest: (p0) async {
//                           final where = names.where((e) {
//                             final strList = [e.itemName, e.description, e.uom]
//                                 .nonNulls
//                                 .toList();
//                             return strList
//                                 .caseInsensitiveSearch(p0, (str) => str)
//                                 .isNotEmpty;
//                           });

//                           return where.toList();
//                         },
//                         headerBuilder: (_, item, __) => Text(item.name ?? ''),
//                         listItemBuilder: (_, item, __, ___) => CompactListTile(
//                               title: item.name!,
//                               subtitle: item.itemName,
//                             ),
//                         onSelected: (names) {
//                           setState(() {
//                             materialName.text = names.name.valueOrEmpty;
//                             serialNumber.text = names.name!;
//                             uom.text = names.uom!;
//                           });
//                         });
//                   },
//                 ),
//                 InputField(
//                   borderColor: AppColors.marigoldDDust,
//                   title: 'Serial Number',
//                   controller: serialNumber,
//                   isRequired: true,
//                   readOnly: true,
//                   validator: (p0) {
//                     if (serialNumber.text.doesNotHaveValue) {
//                       return 'Select Materal Name';
//                     }
//                     return null;
//                   },
//                 ),
//                 InputField(
//                   borderColor: AppColors.marigoldDDust,
//                   title: 'Asset Number',
//                   isRequired: false,
//                   inputType: TextInputType.number,
//                   controller: assetNumber,
//                   // validator: (p0) {
//                   //   if (p0.doesNotHaveValue) return 'Enter Asset Number';
//                   //   return null;
//                   // },
//                 ),
//                 InputField(
//                   borderColor: AppColors.marigoldDDust,
//                   title: 'Quantity',
//                   inputType: TextInputType.number,
//                   isRequired: true,
//                   controller: quantity,
//                   validator: (p0) {
//                     if (p0.doesNotHaveValue) return 'Enter Quanity';
//                     return null;
//                   },
//                 ),
//                 InputField(
//                   borderColor: AppColors.marigoldDDust,
//                   title: 'UOM',
//                   isRequired: true,
//                   readOnly: true,
//                   controller: uom,
//                   validator: (p0) {
//                     if (p0.doesNotHaveValue) return 'Enter UOM';
//                     return null;
//                   },
//                 ),
//                 // CheckboxListTile(
//                 //   value: isreturn,
//                 //   onChanged: (value) {
//                 //     setState(() {
//                 //       isreturn = !isreturn;
//                 //     });
//                 //   },
//                 //   activeColor: Colors.black,
//                 //   checkboxShape: RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(4.0)),
//                 //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 //   isThreeLine: false,
//                 //   dense: true,
//                 //   contentPadding: EdgeInsets.zero,
//                 //   title:
//                 //       const CaptionText(title: 'Is-Return', isRequired: false),
//                 //   controlAffinity: ListTileControlAffinity.leading,
//                 // ),
//                 InputField(
//                   borderColor: AppColors.marigoldDDust,
//                   title: 'Amount',
//                   inputType: TextInputType.number,
//                   isRequired: true,
//                   controller: amount,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(
//                         RegExp(r'^\d+(\.\d{0,2})?$')),
//                   ],
//                   validator: (p0) {
//                     if (p0.doesNotHaveValue) return 'Enter Amount';
//                     return null;
//                   },
//                 ),
//                 if (materialName.text == 'Other') ...[
//                   InputField(
//                     borderColor: AppColors.marigoldDDust,
//                     title: 'Description',
//                     inputType: TextInputType.multiline,
//                     isRequired: true,
//                     controller: description,
//                     validator: (p0) {
//                       if (p0.doesNotHaveValue) return 'Enter Description';
//                       return null;
//                     },
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: context.exit,
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.marigoldDDust),
//           onPressed: () {
//             final validate = _formKey.currentState?.validate();
//             if (validate.isTrue) {
//               context
//                 ..cubit<CreateGateEntryCubit>().addLineItem(
//                     name: materialName.text,
//                     code: serialNumber.text,
//                     asset: assetNumber.text,
//                     qty: quantity.text,
//                     uom: uom.text,
//                     // isreturn: isreturn,
//                     description: description.text,
//                     amt: amount.text)
//                 ..exit();
//             }
//           },
//           child: const Text(
//             'Save',
//             style: TextStyle(color: AppColors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
