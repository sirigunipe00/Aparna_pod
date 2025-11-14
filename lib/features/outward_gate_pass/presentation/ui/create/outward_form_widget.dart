import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/cubit/create_outward_cubit.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/ui/widgets/outward_lines_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/inputs/time_selection_field.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OutwardFormWidget extends StatefulWidget {
  const OutwardFormWidget({super.key});

  @override
  State<OutwardFormWidget> createState() => _OutwardFormWidgetState();
}

class _OutwardFormWidgetState extends State<OutwardFormWidget> {
  final ScrollController _scrollController = ScrollController();

  final focusNodes = List.generate(30, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateOutwardCubit>().state;
    final form = formState.form;
    final isSubmitted = formState.type == ActionType.completed;
    return MultiBlocListener(
      listeners: [
        BlocListener<CreateOutwardCubit, CreateOutwardState>(
          listenWhen: (previous, current) {
            final prevStatus = previous.error?.status;
            final currStatus = current.error?.status;
            return prevStatus != currStatus;
          },
          listener: (_, state) async {
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
        BlocListener<OutwardLinesCubit, OutwardLinesCubitState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (data) {
                context.cubit<CreateOutwardCubit>().addAllLines(data);
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
              BlocBuilder<CompanyNameList, NetworkRequestState<List<String>>>(
                builder: (_, state) {
                  final names = state.maybeWhen(
                    orElse: () => <String>[],
                    success: (data) => data,
                  );
                  return SearchDropDownList(
                    color: AppColors.shyMoment,
                    isMandatory: true,
                    items: names,
                    key: UniqueKey(),
                    defaultSelection:
                        names.where((e) => e == form.plantName).firstOrNull,
                    title: 'Plant Name',
                    readOnly: isSubmitted,
                    hint: 'Select Plant Name',
                    isloading: state.isLoading,
                    futureRequest: (p0) async {
                      final where =
                          names.where((e) => e.containsIgnoreCase(p0));
                      return where.toList();
                    },
                    headerBuilder: (_, item, __) => Text(item),
                    listItemBuilder: (_, item, __, ___) => CompactListTile(
                      title: item,
                    ),
                    onSelected: (names) {
                      context
                          .cubit<CreateOutwardCubit>()
                          .onFieldValueChanged(plantName: names);
                    },
                    focusNode: focusNodes.elementAt(0),
                  );
                },
              ),
              AppDropDownWidget(
                hint: 'Select Gate Pass Type',
                title: 'Gate Pass Type',
                isMandatory: true,
                readOnly: isSubmitted,
                defaultSelection: form.gatePassType,
                items: Dropdownoptions.gatePassTypes,
                onSelected: (item) {
                  context
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(gatePassType: item);
                },
                color: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(1),
              ),
              InputField(
                title: 'Gate Pass Date',
                isRequired: true,
                readOnly: true,
                initialValue: form.gatePassDate,
                borderColor: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(2),
              ),
              TimeSelectionField(
                onTimeSelect: (time) {},
                initialValue: form.gatePassTime?.split(".").firstOrNull,
                title: 'Gate Pass Time',
                readOnly: true,
                borderColor: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(3),
              ),
              InputField(
                title: 'Authorised By',
                readOnly: isSubmitted,
                isRequired: true,
                initialValue: form.authorisedBy,
                borderColor: AppColors.shyMoment,
                inputType: TextInputType.text,
                focusNode: focusNodes.elementAt(4),
                onChanged: (p0) {
                  context
                      .cubit<CreateOutwardCubit>()
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
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(vehicleType: item);
                  setState(() {});
                },
                color: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(5),
              ),
              if (form.vehicleType != 'By Hand') ...[
                InputField(
                  title: 'vehicle Number',
                  initialValue: form.vehicleNumber,
                  isRequired: form.vehicleType == 'By Hand' ? false : true,
                  readOnly: isSubmitted,
                  maxLength: 10,
                  borderColor: AppColors.shyMoment,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  onChanged: (p0) {
                    context
                        .cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(vehicleNumber: p0);
                  },
                  focusNode: focusNodes.elementAt(6),
                ),
                InputField(
                  title: 'Driver Mobile Number',
                  readOnly: isSubmitted,
                  isRequired: form.vehicleType == 'By Hand' ? false : true,
                  initialValue: form.driverMobileNumber,
                  borderColor: AppColors.shyMoment,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  inputType: TextInputType.number,
                  onChanged: (p0) {
                    context
                        .cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(driverMobileNumber: p0);
                  },
                  focusNode: focusNodes.elementAt(7),
                ),
              ],
              InputField(
                title: 'Outward No',
                readOnly: isSubmitted,
                isRequired: true,
                initialValue: form.outwardNo,
                borderColor: AppColors.shyMoment,
                inputType: TextInputType.text,
                focusNode: focusNodes.elementAt(8),
                onChanged: (p0) {
                  context
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(outwardNo: p0);
                },
              ),
              DateSelectionField(
                firstDate: DFU.now(),
                lastDate: DFU.now().add(const Duration(days: 60)),
                onDateSelect: (date) {
                  final dateString = DateFormat('yyyy-MM-dd').format(date);
                  context
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(outwardDate: dateString);
                },
                initialValue: form.outwardDate,
                suffixIcon: const Icon(Icons.calendar_month_outlined),
                title: 'Outward Date',
                isRequired: form.gatePassType == 'Gatepass Non-Returnable' ? false : true,
                readOnly: isSubmitted,
                borderColor: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(9),
              ),
              BlocBuilder<CreateOutwardCubit, CreateOutwardState>(
                builder: (_, state) {
                  return CheckboxListTile(
                    value: state.form.ismanualvendor == 1,
                    onChanged: isSubmitted
                        ? null
                        : (value) {
                            context
                                .cubit<CreateOutwardCubit>()
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
                  );
                },
              ),
              if (form.ismanualvendor == 1) ...[
                InputField(
                  title: 'Vendor/Customer Manual',
                  isRequired: true,
                  readOnly: isSubmitted,
                  initialValue: form.vendorCustomerManual,
                  borderColor: AppColors.shyMoment,
                  inputType: TextInputType.text,
                  focusNode: focusNodes.elementAt(10),
                  onChanged: (p0) {
                    context
                        .cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(vendorCustomerManual: p0);
                  },
                ),
                InputField(
                  title: 'Vendor/Customer Manual Address',
                  isRequired: true,
                  readOnly: isSubmitted,
                  minLines: 3,
                  initialValue: form.vendorAddress,
                  borderColor: AppColors.shyMoment,
                  inputType: TextInputType.text,
                  focusNode: focusNodes.elementAt(11),
                  onChanged: (p0) {
                    context
                        .cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(vendorAddress: p0);
                  },
                ),
              ] else ...[
                AppDropDownWidget(
                  hint: 'Select Vendor/Customer',
                  title: 'Vendor/Customer',
                  isMandatory: true,
                  readOnly: isSubmitted,
                  defaultSelection: form.vendorcustomer,
                  items: Dropdownoptions.vendorCustomerType,
                  onSelected: (item) {
                    context
                        .cubit<CreateOutwardCubit>()
                        .onFieldValueChanged(vendorcustomer: item);
                    setState(() {});
                  },
                  color: AppColors.shyMoment,
                  focusNode: focusNodes.elementAt(12),
                ),
                if (form.vendorcustomer == 'Supplier') ...[
                  BlocBuilder<SupplierNameList, SupplierNameListState>(
                    builder: (_, state) {
                      final names = state.maybeWhen(
                        orElse: () => <SupplierNameForm>[],
                        success: (data) => data,
                      );
                      return SearchDropDownList(
                        color: AppColors.shyMoment,
                        items: names,
                        key: UniqueKey(),
                        defaultSelection: names
                            .where((e) => e.name == form.vendorRecords)
                            .firstOrNull,
                        title: 'Supplier Records',
                        hint: 'Select Supplier Records',
                        readOnly: isSubmitted,
                        isloading: state.isLoading,
                        isMandatory: true,
                        futureRequest: (p0) async {
                          final where = names.where((e) =>
                              e.name.containsIgnoreCase(p0) ||
                              e.supName.containsIgnoreCase(p0));
                          return where.toList();
                        },
                        headerBuilder: (_, item, __) => Text(item.supName),
                        listItemBuilder: (_, item, __, ___) => CompactListTile(
                          title: item.name,
                          subtitle: item.supName,
                        ),
                        onSelected: (names) {
                          context
                              .cubit<CreateOutwardCubit>()
                              .onFieldValueChanged(vendorRecords: names.name);
                        },
                        focusNode: focusNodes.elementAt(13),
                      );
                    },
                  ),
                ] else ...[
                  BlocBuilder<ReceiverNameList, ReceiverNameListState>(
                    builder: (_, state) {
                      final names = state.maybeWhen(
                        orElse: () => <ReceiverNameForm>[],
                        success: (data) => data,
                      );
                      return SearchDropDownList(
                        color: AppColors.shyMoment,
                        items: names,
                        key: UniqueKey(),
                        defaultSelection: names
                            .where((e) => e.name == form.vendorRecords)
                            .firstOrNull,
                        title: 'Customer Records',
                        hint: 'Select Customer Records',
                        readOnly: isSubmitted,
                        isloading: state.isLoading,
                        isMandatory: true,
                        futureRequest: (p0) async {
                          final where = names.where((e) =>
                              e.custName.containsIgnoreCase(p0) ||
                              e.name.containsIgnoreCase(p0));
                          return where.toList();
                        },
                        headerBuilder: (_, item, __) => Text(item.custName),
                        listItemBuilder: (_, item, __, ___) => CompactListTile(
                          title: item.name,
                          subtitle: item.custName,
                        ),
                        onSelected: (names) {
                          context
                              .cubit<CreateOutwardCubit>()
                              .onFieldValueChanged(
                                vendorRecords: names.name,
                              );
                        },
                        focusNode: focusNodes.elementAt(14),
                      );
                    },
                  ),
                ],
              ],
              PhotoSelectionWidget(
                borderColor: AppColors.shyMoment,
                isReadOnly: isSubmitted,
                // isRequired: true,
                fileName: 'Gate Pass Image',
                title: 'Gate Pass Image',
                defaultValue: form.gatePassImg,
                imageUrl: form.gatePassPhoto,
                onFileCapture: (file) {
                  context
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(gatePassPhoto: file);
                },
                focusNode: focusNodes.elementAt(15),
              ),
              InputField(
                title: 'Remarks',
                initialValue: form.remarks,
                readOnly: isSubmitted,
                borderColor: AppColors.shyMoment,
                inputType: TextInputType.name,
                onChanged: (p0) {
                  context
                      .cubit<CreateOutwardCubit>()
                      .onFieldValueChanged(remarks: p0);
                },
                focusNode: focusNodes.elementAt(16),
              ),
              AppSpacer.p4(),
              OutwardLinesWidget(
                oncall: (lines) {
                },
              ),
              AppSpacer.p8(),
              if (!isSubmitted) ...[
                BlocBuilder<CreateOutwardCubit, CreateOutwardState>(
                  builder: (context, state) {
                    return AppButton(
                      isLoading: state.isLoading,
                      onPressed: () {
                        context
                            .cubit<CreateOutwardCubit>()
                            .onFieldValueChanged(items: List.from(state.lines));
                        context
                            .cubit<CreateOutwardCubit>()
                            .processOutwardGatePass();
                      },
                      label: state.type.toName(),
                    );
                  },
                )
              ]
            ],
          )),
    );
  }
}
