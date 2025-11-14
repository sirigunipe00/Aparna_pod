import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/cubit/create_inward_cubit.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/widgets/inward_lines_widget.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/inputs/time_selection_field.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InwardFormWidget extends StatefulWidget {
  const InwardFormWidget({super.key});

  @override
  State<InwardFormWidget> createState() => _InwardFormWidgetState();
}

class _InwardFormWidgetState extends State<InwardFormWidget> {
  final ScrollController _scrollController = ScrollController();

  final focusNodes = List.generate(30, (index) => FocusNode());

  List<OutwardForm> items = <OutwardForm>[];
  OutwardForm? itemData;
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateInwardCubit>().state;
    final form = formState.form;
    final isSubmitted = formState.type == ActionType.completed;

    $logger.devLog(formState);

    return MultiBlocListener(
        listeners: [
          BlocListener<OutwardNoListCubit, OutwardNoListCubitState>(
            listener: (_, state) {
              final outwardItems = state.maybeWhen(
                orElse: () => <OutwardForm>[],
                success: (data) => data,
              );

              setState(() {
                items = outwardItems;
              });
              state.maybeWhen(
                orElse: () {},
                failure: (failure) {
                  AppDialog.showErrorDialog(context,
                      content: failure.error,
                      onTapDismiss: context.exit,
                      title: failure.title);
                  context.cubit<CreateInwardCubit>().reset();
                  setState(() {});
                },
              );
            },
          ),
          BlocListener<CreateInwardCubit, CreateInwardState>(
            listenWhen: (previous, current) {
              final prevStatus = previous.error?.status;
              final currStatus = current.error?.status;
              return prevStatus != currStatus;
            },
            listener: (context, state) async {
              final indx = state.error?.status;
              if (indx != null) {
                try {
                  final focus = focusNodes.elementAt(indx);
                  FocusScope.of(context).requestFocus(focus);
                  await Scrollable.ensureVisible(
                    focus.context!,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } catch (e) {
                  //.error(e);
                }
              }
            },
          ),
          BlocListener<InwardLinesCubit, InwardLinesCubitState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) {
                  context.cubit<CreateInwardCubit>().addAllLines(data);
                },
              );
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
                  BlocBuilder<OutwardNoListCubit,
                      NetworkRequestState<List<OutwardForm>>>(
                    builder: (context, state) {
                      final outNum = state.maybeWhen(
                        orElse: () => <OutwardForm>[],
                        success: (data) => data,
                      );

                      return BlocBuilder<CreateInwardCubit, CreateInwardState>(
                        builder: (_, formState) {
                          return SearchDropDownList(
                            color: AppColors.marigoldDDust,
                            isMandatory: true,
                            items: outNum.map((e) => e.name ?? '').toList(),
                            defaultSelection: formState.form.outwardNo,
                            title: 'Outward No',
                            hint: 'Select Outward No',
                            key: UniqueKey(),
                            readOnly: isSubmitted,
                            isloading: state.isLoading,
                            futureRequest: (p0) async {
                              final where = outNum.where(
                                  (e) => (e.name ?? '').containsIgnoreCase(p0));
                              return where.map((e) => e.name ?? '').toList();
                            },
                            headerBuilder: (_, item, __) => Text(item),
                            listItemBuilder: (_, item, __, ___) =>
                                CompactListTile(
                              title: item,
                            ),
                            onSelected: (item) {
                              OutwardForm matchedForms = outNum
                                  .where((form) => form.name == item)
                                  .toList()
                                  .first;

                              context
                                  .cubit<CreateInwardCubit>()
                                  .onFieldValueChanged(
                                    outwardNo: matchedForms.name,
                                    plantName: matchedForms.plantName,
                                    authorisedBy: matchedForms.authorisedBy,
                                    // driverMobileNumber: matchedForms.driverMobileNumber,
                                    // gatePassDate: matchedForms.gatePassDate,
                                    gatePassPhoto: matchedForms.gatePassImg,
                                    // gatePassTime: matchedForms.gatePassTime,
                                    gatePassType: matchedForms.gatePassType,
                                    ismanualvendor: matchedForms.ismanualvendor,
                                    items: matchedForms.itemLines,
                                    outwardDate: matchedForms.outwardDate,
                                    // remarks: matchedForms.remarks,
                                    // vehicleNumber: matchedForms.vehicleNumber,
                                    // vehicleType: matchedForms.vehicleType,
                                    vendorAddress: matchedForms.vendorAddress,
                                    vendorCustomerManual:
                                        matchedForms.vendorCustomerManual,
                                    vendorRecords: matchedForms.vendorRecords,
                                    vendorcustomer: matchedForms.vendorcustomer,
                                  );
                              setState(() {
                                itemData = matchedForms;
                              });
                              $logger.devLog('itemdata : $itemData');
                            },
                            focusNode: focusNodes.elementAt(0),
                          );
                        },
                      );
                    },
                  ),
                  InputField(
                    title: 'Plant Name',
                    isRequired: true,
                    readOnly: true,
                    initialValue: form.plantName,
                    borderColor: AppColors.marigoldDDust,
                    focusNode: focusNodes.elementAt(1),
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(plantName: p0);
                    },
                  ),
                  InputField(
                    title: 'Gate Pass Type',
                    isRequired: true,
                    readOnly: true,
                    initialValue: form.gatePassType,
                    borderColor: AppColors.marigoldDDust,
                    focusNode: focusNodes.elementAt(2),
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(gatePassType: p0);
                    },
                  ),
                  InputField(
                    title: 'Gate Pass Date',
                    isRequired: true,
                    readOnly: true,
                    initialValue: form.gatePassDate,
                    borderColor: AppColors.marigoldDDust,
                    focusNode: focusNodes.elementAt(3),
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(gatePassDate: p0);
                    },
                  ),
                  TimeSelectionField(
                    onTimeSelect: (time) {},
                    initialValue: form.gatePassTime?.split(".").firstOrNull,
                    title: 'Gate Pass Time',
                    readOnly: true,
                    borderColor: AppColors.marigoldDDust,
                    focusNode: focusNodes.elementAt(4),
                  ),
                  InputField(
                    title: 'Authorised By',
                    readOnly: isSubmitted,
                    initialValue: form.authorisedBy,
                    borderColor: AppColors.marigoldDDust,
                    inputFormatters: [UpperCaseTextFormatter()],
                    focusNode: focusNodes.elementAt(5),
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(authorisedBy: p0);
                    },
                  ),
                  AppDropDownWidget(
                    hint: 'Select Vehicle Type',
                    title: 'Vehicle Type',
                    isMandatory: true,
                    readOnly: isSubmitted,
                    defaultSelection: form.vehicleType,
                    items: Dropdownoptions.vehicleTypeIn,
                    onSelected: (item) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(vehicleType: item);
                      setState(() {});
                    },
                    color: AppColors.marigoldDDust,
                    focusNode: focusNodes.elementAt(5),
                  ),

                  // InputField(
                  //   title: 'Vehicle Type',
                  //   isRequired: true,
                  //   readOnly: true,
                  //   initialValue: form.vehicleType,
                  //   borderColor: AppColors.shyMoment,
                  //   inputType: TextInputType.text,
                  //   focusNode: focusNodes.elementAt(6),
                  //          onChanged: (p0) {
                  //     context
                  //         .cubit<CreateInwardCubit>()
                  //         .onFieldValueChanged(vehicleType: p0);
                  //   },
                  // ),
                  if (form.vehicleType != 'By Hand') ...[
                    InputField(
                      title: 'vehicle Number',
                      initialValue: form.vehicleNumber,
                      isRequired: true,
                      readOnly: isSubmitted,
                      maxLength: 10,
                      borderColor: AppColors.marigoldDDust,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(vehicleNumber: p0);
                      },
                      focusNode: focusNodes.elementAt(7),
                    ),
                    InputField(
                      title: 'Driver Mobile Number',
                      readOnly: isSubmitted,
                      isRequired: true,
                      initialValue: form.driverMobileNumber,
                      borderColor: AppColors.marigoldDDust,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                      inputType: TextInputType.number,
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(driverMobileNumber: p0);
                      },
                      focusNode: focusNodes.elementAt(8),
                    ),
                  ],
                  InputField(
                    title: 'Outward Date',
                    isRequired: true,
                    readOnly: true,
                    initialValue: form.outwardDate,
                    borderColor: AppColors.marigoldDDust,
                    inputType: TextInputType.text,
                    focusNode: focusNodes.elementAt(9),
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(outwardDate: p0);
                    },
                  ),
                  CheckboxListTile(
                    value: itemData == null
                        ? form.ismanualvendor == 1
                        : itemData?.ismanualvendor == 1,
                    onChanged: isSubmitted
                        ? null
                        : (value) {
                            context
                                .cubit<CreateInwardCubit>()
                                .onFieldValueChanged(
                                    ismanualvendor: value == true ? 1 : 0);
                            setState(() {});
                          },
                    activeColor: Colors.black,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    isThreeLine: false,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Is Manual Vendor/Customer',
                      style: TextStyle(
                          color: AppColors.subtitlecolor,
                          fontWeight: FontWeight.bold),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (itemData == null
                      ? form.ismanualvendor == 1
                      : itemData?.ismanualvendor == 1) ...[
                    InputField(
                      title: 'Vendor/Customer Manual',
                      isRequired: true,
                      readOnly: true,
                      initialValue: form.vendorCustomerManual,
                      borderColor: AppColors.marigoldDDust,
                      inputType: TextInputType.text,
                      focusNode: focusNodes.elementAt(10),
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(vendorCustomerManual: p0);
                      },
                    ),
                    InputField(
                      title: 'Vendor/Customer Manual Address',
                      isRequired: true,
                      readOnly: true,
                      minLines: 3,
                      initialValue: form.vendorAddress,
                      borderColor: AppColors.marigoldDDust,
                      inputType: TextInputType.text,
                      focusNode: focusNodes.elementAt(11),
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(vendorAddress: p0);
                      },
                    ),
                  ] else ...[
                    InputField(
                      title: 'Vendor/Customer',
                      isRequired: true,
                      readOnly: true,
                      initialValue: form.vendorcustomer,
                      borderColor: AppColors.marigoldDDust,
                      inputType: TextInputType.text,
                      focusNode: focusNodes.elementAt(12),
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(vendorcustomer: p0);
                      },
                    ),
                    InputField(
                      title: itemData?.vendorcustomer == 'Supplier'
                          ? 'Supplier Records'
                          : 'Customer Records',
                      isRequired: true,
                      readOnly: true,
                      initialValue: form.vendorRecords,
                      borderColor: AppColors.marigoldDDust,
                      inputType: TextInputType.text,
                      focusNode: focusNodes.elementAt(13),
                      onChanged: (p0) {
                        context
                            .cubit<CreateInwardCubit>()
                            .onFieldValueChanged(vendorRecords: p0);
                      },
                    ),
                  ],
                  PhotoSelectionWidget(
                    borderColor: AppColors.marigoldDDust,
                    isReadOnly: isSubmitted,
                    fileName: 'Gate Pass Image',
                    title: 'Gate Pass Image',
                    defaultValue: form.gatePassImg,
                    imageUrl: form.gatePassPhoto,
                    onFileCapture: (file) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(gatePassPhoto: file);
                    },
                    focusNode: focusNodes.elementAt(14),
                  ),
                  InputField(
                    title: 'Remarks',
                    initialValue: form.remarks,
                    readOnly: isSubmitted,
                    borderColor: AppColors.marigoldDDust,
                    inputType: TextInputType.name,
                    onChanged: (p0) {
                      context
                          .cubit<CreateInwardCubit>()
                          .onFieldValueChanged(remarks: p0);
                    },
                    focusNode: focusNodes.elementAt(15),
                  ),
                  AppSpacer.p4(),
                  GatePassInLinesWidget(
                    lines: itemData?.itemLines ?? [],
                    onItems: (newlines) {
                      // itemData?.itemLines = newlines;
                    },
                  ),
                  AppSpacer.p8(),
                  if (!isSubmitted) ...[
                    BlocBuilder<CreateInwardCubit, CreateInwardState>(
                      builder: (context, state) {
                        return AppButton(
                          isLoading: state.isLoading,
                          onPressed: () {
                            if (form.docstatus == 0) {
                              context
                                  .cubit<CreateInwardCubit>()
                                  .onFieldValueChanged(
                                      items: List.from(state.lines));
                            }

                            context
                                .cubit<CreateInwardCubit>()
                                .processInwardGatePass();
                          },
                          label: state.type.toName(),
                        );
                      },
                    )
                  ]
                ])));
  }
}
