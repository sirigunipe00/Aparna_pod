import 'package:aparna_pod/app/widgets/section_head.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/data/static_data.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/widgets/entry_lines_widget.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_address_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
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

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget> {
  final ScrollController _scrollController = ScrollController();

  final focusNodes = List.generate(40, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateGateEntryCubit>().state;
    final isCreating = formState.view == GateEntryView.create;
    final isCompleted = formState.view == GateEntryView.completed;
    final newform = formState.form;

    return MultiBlocListener(
      listeners: [
        BlocListener<AttachmentsList,AttachmentsListState>(
          listener:(_, state) {
            state.maybeWhen(
              orElse: (){},
              success: (data) {
                context.cubit<CreateGateEntryCubit>().addInvUrls(data);
                setState(() {});
              },
            );
          },
        ),
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
        BlocListener<GateEntryLinesCubit, GateEntryLinesCubitState>(
          listener: (_, state) {
            state.maybeWhen(
              orElse: () {},
              success: context.cubit<CreateGateEntryCubit>().addAllLines,
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
            const SectoinHead(title: 'Header Details'),
            BlocBuilder<CompanyNameList, NetworkRequestState<List<String>>>(
              builder: (_, state) {
                final names = state.maybeWhen(
                  orElse: () => <String>[],
                  success: (data) => data,
                );
                return SearchDropDownList(
                  color: AppColors.marigoldDDust,
                  isMandatory: true,
                  items: names,
                  key: UniqueKey(),
                  defaultSelection:
                      names.where((e) => e == newform.plantName).firstOrNull,
                  title: 'Plant Name',
                  hint: 'Select Plant Name',
                  readOnly: isCompleted,
                  isloading: state.isLoading,
                  futureRequest: (p0) async {
                    final where = names.where((e) => e.containsIgnoreCase(p0));
                    return where.toList();
                  },
                  headerBuilder: (_, item, __) => Text(item),
                  listItemBuilder: (_, item, __, ___) => CompactListTile(
                    title: item,
                  ),
                  onSelected: (names) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(plantName: names);
                  },
                  focusNode: focusNodes.elementAt(0),
                );
              },
            ),
            InputField(
              title: 'Gate Entry Date',
              isRequired: true,
              readOnly: true,
              initialValue: newform.creationDate,
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(2),
              inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
            TimeSelectionField(
              borderColor: AppColors.marigoldDDust,
              readOnly: isCompleted,
              initialValue: newform.entryTime?.split('.').firstOrNull,
              title: 'Gate Enty Time',
              onTimeSelect: (time) {},
            ),
            AppDropDownWidget(
                hint: 'Select Gate Entry Type',
                readOnly: isCompleted,
                color: AppColors.marigoldDDust,
                title: 'Gate Entry Type',
                isMandatory: true,
                defaultSelection: newform.entryType,
                items: AppStaticData.gateEntryType,
                focusNode: focusNodes.elementAt(1),
                onSelected: (entryType) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(gateEntryType: entryType);
                  setState(() {});
                }),
            if (newform.entryType == 'Gatepass Returnable') ...[
              DateSelectionField(
                firstDate: DFU.now(),
                lastDate: DFU.now().add(const Duration(days: 60)),
                onDateSelect: (date) {
                  final dateString = DateFormat('yyyy-MM-dd').format(date);
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(expectedReturnDate: dateString);
                },
                initialValue: newform.expectedReturnDate,
                suffixIcon: const Icon(Icons.calendar_month_outlined),
                title: 'Expected Return Date',
                isRequired:
                    newform.entryType == 'Gatepass Returnable' ? true : false,
                readOnly: isCompleted,
                borderColor: AppColors.marigoldDDust,
                focusNode: focusNodes.elementAt(31),
              ),
            ],
            const Divider(height: 1),
            const SectoinHead(title: 'Sender Details'),
            AppDropDownWidget(
                color: AppColors.marigoldDDust,
                hint: 'Select Material Type',
                defaultSelection: newform.materialType,
                title: 'Material Type',
                isMandatory: true,
                readOnly: isCompleted,
                focusNode: focusNodes.elementAt(3),
                items: AppStaticData.materialType,
                onSelected: (materialType) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(materialType: materialType);
                  setState(() {});
                }),
            if (newform.materialType != null) ...[
              if (newform.materialType == 'Sales Return') ...[
                BlocBuilder<ReceiverNameList, ReceiverNameListState>(
                  builder: (_, state) {
                    final names = state.maybeWhen(
                      orElse: () => <ReceiverNameForm>[],
                      success: (data) => data,
                    );
                    return SearchDropDownList(
                      color: AppColors.marigoldDDust,
                      items: names,
                      key: UniqueKey(),
                      defaultSelection: names
                          .where((e) => e.name == newform.customerName)
                          .firstOrNull,
                      title: 'Customer Name',
                      hint: 'Select Customer Name',
                      readOnly: isCompleted,
                      isloading: state.isLoading,
                      futureRequest: (p0) async {
                        final where = names
                            .where((e) => e.custName.containsIgnoreCase(p0));
                        return where.toList();
                      },
                      headerBuilder: (_, item, __) => Text(item.custName),
                      listItemBuilder: (_, item, __, ___) => CompactListTile(
                        title: item.custName,
                      ),
                      onSelected: (names) {
                        context.cubit<CreateGateEntryCubit>().onValueChanged(
                              customerName: names.name,
                            );
                        context
                            .cubit<ReceiverAddressList>()
                            .request(names.name);
                        setState(() {});
                      },
                      focusNode: focusNodes.elementAt(32),
                    );
                  },
                ),
                BlocConsumer<ReceiverAddressList, ReceiverAddressListState>(
                  listener: (_, state) {
                    final address = state.maybeWhen(
                      orElse: () => <ReceiverAddressForm>[],
                      success: (data) => data,
                    );
                    context.cubit<CreateGateEntryCubit>().onValueChanged(
                          customerAddress: '${address.firstOrNull?.parent}',
                        );
                    setState(() {});
                  },
                  builder: (_, state) {
                    final address = state.maybeWhen(
                      orElse: () => <ReceiverAddressForm>[],
                      success: (data) => data,
                    );
                    return SearchDropDownList(
                      color: AppColors.marigoldDDust,
                      items: address,
                      key: UniqueKey(),
                      defaultSelection: address
                          .where((e) => e.parent == newform.customerAddress)
                          .firstOrNull,
                      title: 'Customer Address',
                      hint: 'Select Customer Address',
                      readOnly: isCompleted,
                      isloading: state.isLoading,
                      futureRequest: (p0) async {
                        final where = address.where((e) {
                          final strList = [e.line1, e.line2, e.pincode, e.city]
                              .nonNulls
                              .toList();
                          return strList
                              .caseInsensitiveSearch(p0, (str) => str)
                              .isNotEmpty;
                        });
                        return where.toList();
                      },
                      headerBuilder: (_, item, __) => Text('${item.parent}'),
                      listItemBuilder: (_, e, __, ___) => CompactListTile(
                        title: '${e.parent}',
                        subtitle: [e.line1, e.line2, e.pincode, e.city]
                            .nonNulls
                            .join(', '),
                      ),
                      onSelected: (address) {
                        context.cubit<CreateGateEntryCubit>().onValueChanged(
                            customerAddress: '${address.parent}');
                      },
                      focusNode: focusNodes.elementAt(33),
                    );
                  },
                ),
              ] else ...[
                BlocBuilder<SupplierNameList, SupplierNameListState>(
                  builder: (_, state) {
                    final names = state.maybeWhen(
                      orElse: () => <SupplierNameForm>[],
                      success: (data) => data,
                    );
                    return SearchDropDownList(
                      color: AppColors.marigoldDDust,
                      items: names,
                      key: UniqueKey(),
                      defaultSelection: names
                          .where((e) => e.name == newform.supplierName)
                          .firstOrNull,
                      title: 'Supplier Name',
                      hint: 'Select Supplier Name',
                      readOnly: isCompleted,
                      isloading: state.isLoading,
                      futureRequest: (p0) async {
                        final where = names.where((e) =>
                            e.name.containsIgnoreCase(p0) ||
                            e.supName.containsIgnoreCase(p0));
                        return where.toList();
                      },
                      headerBuilder: (_, item, __) => Text(item.supName),
                      listItemBuilder: (_, item, __, ___) => CompactListTile(
                        title: item.supName,
                      ),
                      onSelected: (names) {
                        context
                            .cubit<CreateGateEntryCubit>()
                            .onValueChanged(supplierName: names.name);

                        context
                            .cubit<ReceiverAddressList>()
                            .request(names.name);
                      },
                      focusNode: focusNodes.elementAt(4),
                    );
                  },
                ),
                BlocConsumer<ReceiverAddressList, ReceiverAddressListState>(
                  listener: (_, state) {
                    final address = state.maybeWhen(
                      orElse: () => <ReceiverAddressForm>[],
                      success: (data) => data,
                    );
                    context.cubit<CreateGateEntryCubit>().onValueChanged(
                          supplierAddress: address.firstOrNull?.parent,
                        );
                    setState(() {});
                  },
                  builder: (_, state) {
                    final address = state.maybeWhen(
                      orElse: () => <ReceiverAddressForm>[],
                      success: (data) => data,
                    );
                    return SearchDropDownList(
                      color: AppColors.marigoldDDust,
                      items: address,
                      key: UniqueKey(),
                      defaultSelection: address
                          .where((e) => e.parent == newform.supplierAddress)
                          .firstOrNull,
                      title: 'Supplier Address',
                      hint: 'Select Supplier Address',
                      readOnly: isCompleted,
                      isloading: state.isLoading,
                      futureRequest: (p0) async {
                        final where = address.where((e) {
                          final strList = [e.line1, e.line2, e.pincode, e.city]
                              .nonNulls
                              .toList();
                          return strList
                              .caseInsensitiveSearch(p0, (str) => str)
                              .isNotEmpty;
                        });
                        return where.toList();
                      },
                      headerBuilder: (_, item, __) => Text('${item.parent}'),
                      listItemBuilder: (_, e, __, ___) => CompactListTile(
                        title: '${e.parent}',
                        subtitle: [e.line1, e.line2, e.pincode, e.city]
                            .nonNulls
                            .join(', '),
                      ),
                      onSelected: (address) {
                        context.cubit<CreateGateEntryCubit>().onValueChanged(
                            supplierAddress: '${address.parent}');
                      },
                      focusNode: focusNodes.elementAt(5),
                    );
                  },
                ),
              ],
            ],
            InputField(
              readOnly: isCompleted,
              initialValue: newform.senderName,
              title: 'Sender Name',
              isRequired: false,
              borderColor: AppColors.marigoldDDust,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(senderName: p0);
              },
              focusNode: focusNodes.elementAt(6),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.senderMobileNo,
              title: 'Sender Mobile No',
              borderColor: AppColors.marigoldDDust,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              inputType: TextInputType.number,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(senderMobileNo: p0);
              },
              focusNode: focusNodes.elementAt(7),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Receiver Details'),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.receiverName,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(receiverName: p0);
              },
              title: 'Receiver Name',
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(8),
            ),
            AppDropDownWidget(
              hint: 'Select Receiver Department',
              readOnly: isCompleted,
              defaultSelection: newform.receiverDept,
              title: 'Receiver Department',
              items: AppStaticData.receiverDept,
              onSelected: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(receiverDept: p0);
              },
              color: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(9),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.receiverMobile,
              title: 'Receiver Mobile Number',
              borderColor: AppColors.marigoldDDust,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              inputType: TextInputType.number,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(receiverMobile: p0);
              },
              focusNode: focusNodes.elementAt(10),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.receiverEmail,
              title: 'Receiver Email',
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(receiverEmail: p0);
              },
              focusNode: focusNodes.elementAt(11),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Shipment Details'),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.poNumber,
              title: 'PO Number',
              isRequired: false,
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(poNumber: p0);
              },
              focusNode: focusNodes.elementAt(12),
            ),
            BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              builder: (context, state) {
                return CheckboxListTile(
                  value: state.form.isewayBill == 1,
                  onChanged: isCompleted
                      ? null
                      : (value) {
                          context.cubit<CreateGateEntryCubit>().onValueChanged(
                              isewaiBill: value == true ? 1 : 0);
                          setState(() {});
                        },
                  activeColor: Colors.black,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  isThreeLine: false,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const CaptionText(
                      title: 'Is-Eway Bill', isRequired: false),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.ewayBill,
              title: 'Eway Bill',
              isRequired: newform.isewayBill == 1 ? true : false,
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(ewayBill: p0);
              },
              focusNode: focusNodes.elementAt(13),
            ),
            AppDropDownWidget(
              hint: 'Select Vehicle Type',
              readOnly: isCompleted,
              defaultSelection: newform.vehicleType,
              title: 'Vehicle Type',
              isMandatory: true,
              items: AppStaticData.vehicleType,
              onSelected: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(vehicleType: p0);
                setState(() {});
              },
              color: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(14),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.challanNumber,
              title: 'Challan Number',
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(challanNo: p0);
              },
              focusNode: focusNodes.elementAt(15),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: NumUtils.toDoubleStr(newform.peopleCount),
              title: 'People Count',
              inputType: TextInputType.number,
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(peapleCount: int.tryParse(p0));
              },
              focusNode: focusNodes.elementAt(16),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.vehicleNumber,
              title: 'Vehicle Number',
              isRequired: newform.vehicleType == 'By Hand' ? false : true,
              borderColor: AppColors.marigoldDDust,
              maxLength: 10,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              suffixIcon: const Icon(Icons.pin_outlined),
              onChanged: (vehicleNo) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(vehicleNo: vehicleNo);
              },
              focusNode: focusNodes.elementAt(17),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.driverName,
              title: 'Driver Name',
              isRequired: newform.vehicleType == 'By Hand' ? false : true,
              borderColor: AppColors.marigoldDDust,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(driverName: p0);
              },
              focusNode: focusNodes.elementAt(18),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.drivermobileNo,
              title: 'Driver Mobile Number',
              isRequired: newform.vehicleType == 'By Hand' ? false : true,
              borderColor: AppColors.marigoldDDust,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              inputType: TextInputType.number,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(driverMobileNo: p0);
              },
              focusNode: focusNodes.elementAt(19),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Weighment Details'),
            InputField(
              readOnly: isCompleted,
              initialValue: newform.weightSlipNo,
              title: 'Weighment SLIP Token No',
              isRequired: false,
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(weightSlipToken: p0);
                // setState(() {});
              },
              focusNode: focusNodes.elementAt(20),
            ),
            InputField(
              readOnly: isCompleted,
              initialValue: NumUtils.toDoubleStr(newform.weight),
              inputType: TextInputType.number,
              title: 'Weight ( in Kgs )',
              isRequired: false,
              borderColor: AppColors.marigoldDDust,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(weight: double.tryParse(p0));
              },
              focusNode: focusNodes.elementAt(21),
            ),
            DateSelectionField(
              readOnly: isCompleted,
              initialValue: newform.weighmentDate,
              title: 'Weighment Date',
              isRequired: false,
              firstDate: DFU.now().subtract(const Duration(days: 60)),
              lastDate: DFU.now(),
              borderColor: AppColors.marigoldDDust,
              suffixIcon: const Icon(Icons.calendar_month_outlined,
                  color: AppColors.chimneySweep),
              onDateSelect: (DateTime date) {},
              focusNode: focusNodes.elementAt(22),
            ),
            TimeSelectionField(
              borderColor: AppColors.marigoldDDust,
              readOnly: isCompleted,
              initialValue: newform.weighmentTime?.split('.').firstOrNull,
              title: 'Weighment Time',
              onTimeSelect: (time) {},
              focusNode: focusNodes.elementAt(23),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Photo Attachment'),
          MultiFileSelectionWidget(
              title: 'Invoice/DC Image (OCR Scanning)',
              initialFiles: newform.invoiceImg,
              initialValue: newform.addInvs,
              removeFile: context.cubit<CreateGateEntryCubit>().removeFile,
              borderColor: AppColors.marigoldDDust,
              
              readOnly: isCompleted,
              focusNode: focusNodes.elementAt(24),
              onImage: (file) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(invoice: file);
              },
            ),
            //   PhotoSelectionWidget(
            //   borderColor: AppColors.marigoldDDust,
            //   title: 'Invoice/DC Image(OCR Scanning)',
            //   fileName: 'Inv_DC_Image',
            //   imageUrl: newform.ocrScanning,
            //   isRequired: false,
            //   defaultValue: newform.invoiceImg.firstOrNull,
            //   onFileCapture: (file) {
            //     context
            //         .cubit<CreateGateEntryCubit>()
            //         .onValueChanged(invoice: file);
            //   },
            //   focusNode: focusNodes.elementAt(26),
            // ),
            PhotoSelectionWidget(
              borderColor: AppColors.marigoldDDust,
              fileName: 'Driver_License_Photo',
              defaultValue: newform.licensePhotoImg,
              isReadOnly: isCompleted,
              imageUrl: newform.driversLicensePhoto,
              title: "Driver's License Photo",
              onFileCapture: (file) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(licensePhoto: file);
              },
              focusNode: focusNodes.elementAt(24),
            ),
            PhotoSelectionWidget(
              borderColor: AppColors.marigoldDDust,
              defaultValue: newform.vehiclePhotoImg,
              fileName: 'Vehicle_Image',
              imageUrl: newform.vehicleImg,
              isReadOnly: isCompleted,
              title: 'Vehicle Image',
              onFileCapture: (file) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(vehiclePhoto: file);
              },
              focusNode: focusNodes.elementAt(25),
            ),
            PhotoSelectionWidget(
              borderColor: AppColors.marigoldDDust,
              defaultValue: newform.sealPhotoImg,
              fileName: 'Seal_Photo',
              imageUrl: newform.sealPhoto,
              title: 'Seal Photo',
              isReadOnly: isCompleted,
              onFileCapture: (file) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(sealPhoto: file);
              },
              focusNode: focusNodes.elementAt(27),
            ),
            PhotoSelectionWidget(
              borderColor: AppColors.marigoldDDust,
              defaultValue: newform.breathAnalyserImg,
              imageUrl: newform.breathAnalyser,
              isReadOnly: isCompleted,
              fileName: 'Breath_Analyser',
              title: 'Breath Analyser',
              onFileCapture: (file) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(breathAnalyser: file);
              },
              focusNode: focusNodes.elementAt(28),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Remarks'),
            InputField(
              borderColor: AppColors.marigoldDDust,
              readOnly: isCompleted,
              initialValue: newform.remarks,
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(remarks: p0);
              },
              title: 'Comment/Remark',
              focusNode: focusNodes.elementAt(29),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Items'),
            const GateEntryLinesWidget(),
            const SizedBox(
              height: 10,
            ),
            // BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
            //   builder: (_, state) {
            //     return InputField(
            //       readOnly: isCompleted,
            //       isRequired: true,
            //       initialValue: NumUtils.inRupeesFormat(state.form.totalAmount),
            //       title: 'Total Amount',
            //       borderColor: AppColors.marigoldDDust,
            //       inputType: TextInputType.number,
            //       // inputFormatters: [
            //       //   FilteringTextInputFormatter.digitsOnly
            //       // ],
            //       onChanged: (p0) {
            //         context
            //             .cubit<CreateGateEntryCubit>()
            //             .onValueChanged(totalAmount: double.tryParse(p0));
            //       },
            //       focusNode: focusNodes.elementAt(30),
            //     );
            //   },
            // ),
            InputField(
                  readOnly: isCompleted,
                  initialValue: NumUtils.inRupeesFormat(newform.totalAmount),
                  title: 'Total Amount',
                  borderColor: AppColors.marigoldDDust,
                  inputType: TextInputType.number,
                  isRequired: true,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  onChanged: (p0) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(totalAmount: double.tryParse(p0));
                  },
                  focusNode: focusNodes.elementAt(30),
                ),
            AppSpacer.p32(),
            if (!isCompleted) ...[
              BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
                builder: (_, state) => AppButton(
                  label: isCreating ? 'Create' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  onPressed: context.cubit<CreateGateEntryCubit>().save,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
