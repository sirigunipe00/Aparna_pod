import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/app/widgets/section_head.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_address_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/cubit/create_gate_exit_cubit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/ui/widgets/gate_exit_lines_widget.dart';
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

class GateExitFormWidget extends StatefulWidget {
  const GateExitFormWidget({super.key});

  @override
  State<GateExitFormWidget> createState() => _GateExitFormWidgetState();
}

class _GateExitFormWidgetState extends State<GateExitFormWidget> {
  final ScrollController _scrollController = ScrollController();

  final focusNodes = List.generate(30, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateGateExitCubit>().state;
    final form = formState.form;
    final isSubmitted = formState.type == ActionType.completed;

    return MultiBlocListener(
      listeners: [
        BlocListener<AttachmentsList,AttachmentsListState>(
          listener:(_, state) {
            state.maybeWhen(
              orElse: (){},
              success: (data) {
                context.cubit<CreateGateExitCubit>().addInvUrls(data);
                setState(() {});
              },
            );
          },
        ),
        BlocListener<CreateGateExitCubit, CreateGateExitState>(
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
        BlocListener<GateExitLinesCubit, GateExitLinesCubitState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (data) {
                context.cubit<CreateGateExitCubit>().addAllLines(data);
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
            const SectoinHead(title: 'Header Details'),
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
                  hint: 'Select Plant Name',
                  readOnly: isSubmitted,
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
                        .cubit<CreateGateExitCubit>()
                        .onFieldValueChanged(plantName: names);
                  },
                  focusNode: focusNodes.elementAt(3),
                );
              },
            ),
            InputField(
              title: 'Gate Exit Date',
              isRequired: true,
              readOnly: true,
              initialValue: form.exitDate,
              borderColor: AppColors.shyMoment,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              focusNode: focusNodes.elementAt(2),
            ),
            TimeSelectionField(
              onTimeSelect: (time) {},
              initialValue: form.exitTime?.split(".").firstOrNull,
              title: 'Gate Exit Time',
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
            ),

            AppDropDownWidget(
              hint: 'Select Gate Exit Type',
              title: 'Gate Exit Type',
              isMandatory: true,
              readOnly: isSubmitted,
              defaultSelection: form.exitType,
              items: Dropdownoptions.gateExitTypes,
              onSelected: (item) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(gateExitType: item);
                setState(() {});
              },
              color: AppColors.shyMoment,
              focusNode: focusNodes.elementAt(1),
            ),
            if (form.exitType == 'Gatepass Returnable') ...[
              DateSelectionField(
                firstDate: DFU.now(),
                lastDate: DFU.now().add(const Duration(days: 60)),
                onDateSelect: (date) {
                  final dateString = DateFormat('yyyy-MM-dd').format(date);
                  context
                      .cubit<CreateGateExitCubit>()
                      .onFieldValueChanged(expectedReturnDate: dateString);
                },
                initialValue: form.expectedReturnDate,
                suffixIcon: const Icon(Icons.calendar_month_outlined),
                title: 'Expected Return Date',
                isRequired:
                    form.exitType == 'Gatepass Returnable' ? true : false,
                readOnly: isSubmitted,
                borderColor: AppColors.shyMoment,
                focusNode: focusNodes.elementAt(27),
              ),
            ],
            const Divider(height: 1),
            const SectoinHead(title: 'Sender Details'),
            InputField(
              title: 'Sender Employee Name',
              initialValue: form.senderEmployeeName?.toUpperCase(),
              isRequired: false,
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
              inputType: TextInputType.name,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(senderEmployeeName: p0);
              },
              focusNode: focusNodes.elementAt(3),
            ),
            InputField(
              title: 'Sender Employee Id',
              readOnly: isSubmitted,
              initialValue: form.senderEmployeeId,
              borderColor: AppColors.shyMoment,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(senderEmpId: p0);
              },
              focusNode: focusNodes.elementAt(4),
            ),
            InputField(
              title: 'Sender Email',
              borderColor: AppColors.shyMoment,
              initialValue: form.senderEmail,
              readOnly: isSubmitted,
              inputType: TextInputType.emailAddress,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(senderEmail: p0);
              },
              focusNode: focusNodes.elementAt(5),
            ),
            InputField(
              title: 'Sender Mobile No',
              borderColor: AppColors.shyMoment,
              initialValue: form.senderMobileNo,
              readOnly: isSubmitted,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              inputType: TextInputType.number,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(senderMblNo: p0);
              },
              focusNode: focusNodes.elementAt(6),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Receiver Details'),
            InputField(
              title: 'GSTIN',
              isRequired: false,
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
              initialValue: form.gstin,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(gstin: p0);
              },
              focusNode: focusNodes.elementAt(7),
            ),
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
                      .where((e) => e.name == form.customerReceiverName)
                      .firstOrNull,
                  title: 'Customer/Receiver Name',
                  hint: 'Select Customer Name',
                  readOnly: isSubmitted,
                  isloading: state.isLoading,
                  futureRequest: (p0) async {
                    final where =
                        names.where((e) => e.custName.containsIgnoreCase(p0));
                    return where.toList();
                  },
                  headerBuilder: (_, item, __) => Text(item.custName),
                  listItemBuilder: (_, item, __, ___) => CompactListTile(
                    title: item.custName,
                  ),
                  onSelected: (names) {
                    context.cubit<CreateGateExitCubit>().onFieldValueChanged(
                        customerReceiverName: names.name, gstin: names.gstin);
                    context.cubit<ReceiverAddressList>().request(
                          names.name,
                        );
                    setState(() {});
                  },
                  focusNode: focusNodes.elementAt(8),
                );
              },
            ),
            BlocConsumer<ReceiverAddressList, ReceiverAddressListState>(
              listener: (_, state) {
                final address = state.maybeWhen(
                  orElse: () => <ReceiverAddressForm>[],
                  success: (data) => data,
                );
                context.cubit<CreateGateExitCubit>().onFieldValueChanged(
                      customerReceiverAddress: '${address.firstOrNull?.parent}',
                    );
                setState(() {});
              },
              builder: (_, state) {
                final address = state.maybeWhen(
                  orElse: () => <ReceiverAddressForm>[],
                  success: (data) => data,
                );
                return SearchDropDownList(
                  color: AppColors.shyMoment,
                  items: address,
                  key: UniqueKey(),
                  defaultSelection: address
                      .where((e) => e.parent == form.customerReceiverAddress)
                      .firstOrNull,
                  title: 'Customer/Receiver Address',
                  hint: 'Select Customer Address',
                  readOnly: isSubmitted,
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
                    context.cubit<CreateGateExitCubit>().onFieldValueChanged(
                        customerReceiverAddress: '${address.parent}');
                  },
                  focusNode: focusNodes.elementAt(9),
                );
              },
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Shipment Details'),
            InputField(
              title: 'PO Number',
              isRequired: false,
              readOnly: isSubmitted,
              initialValue: form.poNumber,
              borderColor: AppColors.shyMoment,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(poNumber: p0);
              },
              focusNode: focusNodes.elementAt(10),
            ),
            AppDropDownWidget(
              hint: 'Select Vehicle Type',
              title: 'Vehicle Type',
              isMandatory: true,
              readOnly: isSubmitted,
              defaultSelection: form.vehicleType,
              items: Dropdownoptions.vehicleType,
              onSelected: (item) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(vehicleType: item);
                setState(() {});
              },
              color: AppColors.shyMoment,
              focusNode: focusNodes.elementAt(11),
            ),
            BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
              builder: (_, state) {
                return CheckboxListTile(
                  value: state.form.isewayBill == 1,
                  onChanged: isSubmitted
                      ? null
                      : (value) {
                          context
                              .cubit<CreateGateExitCubit>()
                              .onFieldValueChanged(
                                  isEwayBill: value == true ? 1 : 0);
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
                    'Is-Eway Bill',
                    style: TextStyle(
                        color: AppColors.subtitlecolor,
                        fontWeight: FontWeight.bold),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
            InputField(
              title: 'is-Eway Bill',
              readOnly: isSubmitted,
              isRequired: form.isewayBill == 1 ? true : false,
              controller: TextEditingController(),
              initialValue: form.ewayBill,
              borderColor: AppColors.shyMoment,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(ewayBill: p0);
              },
              focusNode: focusNodes.elementAt(12),
            ),
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
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(vehicleNo: p0);
              },
              focusNode: focusNodes.elementAt(13),
            ),
            InputField(
              title: 'Challan Number',
              readOnly: isSubmitted,
              initialValue: form.challanNumber,
              borderColor: AppColors.shyMoment,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(challanNumber: p0);
              },
              focusNode: focusNodes.elementAt(14),
            ),
            InputField(
              title: 'Driver Name',
              readOnly: isSubmitted,
              isRequired: form.vehicleType == 'By Hand' ? false : true,
              initialValue: form.driverName?.toUpperCase(),
              borderColor: AppColors.shyMoment,
              inputType: TextInputType.name,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(driverName: p0);
              },
              focusNode: focusNodes.elementAt(15),
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
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(driverMobileNo: p0);
              },
              focusNode: focusNodes.elementAt(16),
            ),
            InputField(
              title: 'People Count',
              readOnly: isSubmitted,
              initialValue: NumUtils.toIntStr(form.peopleCount),
              borderColor: AppColors.shyMoment,
              inputType: const TextInputType.numberWithOptions(decimal: false),
              onChanged: (p0) {
                int count = int.parse(p0);
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(peopleCount: count);
              },
              focusNode: focusNodes.elementAt(17),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Weighment Details'),
            InputField(
              title: 'Weighment SLIP Token No',
              isRequired: false,
              readOnly: isSubmitted,
              initialValue: form.weightSlipNo,
              borderColor: AppColors.shyMoment,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(slipTokenNO: p0);
              },
              focusNode: focusNodes.elementAt(18),
            ),
            InputField(
              title: 'Weight (in Kgs)',
              isRequired: false,
              readOnly: isSubmitted,
              initialValue: NumUtils.toDoubleStr(form.weight),
              borderColor: AppColors.shyMoment,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (p0) {
                double weight = double.parse(p0);
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(weight: weight);
              },
              focusNode: focusNodes.elementAt(19),
            ),
            DateSelectionField(
              firstDate: DFU.now().subtract(const Duration(days: 60)),
              lastDate: DFU.now(),
              onDateSelect: (date) {},
              initialValue: form.weighmentDate,
              title: 'Weighment Date',
              isRequired: false,
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
              focusNode: focusNodes.elementAt(20),
            ),
            TimeSelectionField(
              onTimeSelect: (time) {},
              initialValue: form.weighmentTime?.split(".").firstOrNull,
              title: 'Weighment Time',
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
              focusNode: focusNodes.elementAt(21),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Camera Attachments'),
            PhotoSelectionWidget(
              borderColor: AppColors.shyMoment,
              isReadOnly: isSubmitted,
              fileName: 'Driver_License_Photo',
              title: 'Driver\'s License Photo',
              defaultValue: form.licensePhotoImg,
              imageUrl: form.licensePhoto,
              onFileCapture: (file) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(licensePhoto: file);
              },
              focusNode: focusNodes.elementAt(22),
            ),
            PhotoSelectionWidget(
              fileName: 'Seal_Photo',
              borderColor: AppColors.shyMoment,
              isReadOnly: isSubmitted,
              title: 'Seal Photo',
              defaultValue: form.sealPhotoImg,
              isRequired: form.vehicleType == 'By Hand' ? false : true,
              imageUrl: form.sealPhoto,
              onFileCapture: (file) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(sealPhoto: file);
              },
              focusNode: focusNodes.elementAt(23),
            ),
            PhotoSelectionWidget(
              fileName: 'Vehicle_Image',
              borderColor: AppColors.shyMoment,
              title: 'Vehicle Image',
              isRequired: form.vehicleType == 'By Hand' ? false : true,
              defaultValue: form.vehiclePhotoImg,
              isReadOnly: isSubmitted,
              imageUrl: form.vehiclePhoto,
              onFileCapture: (file) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(vehiclePhoto: file);
              },
              focusNode: focusNodes.elementAt(24),
            ),
            PhotoSelectionWidget(
              fileName: 'Breath_Analyser',
              borderColor: AppColors.shyMoment,
              title: 'Breath Analyser',
              isRequired: form.vehicleType == 'By Hand' ? false : true,
              defaultValue: form.breathAnalyserImg,
              isReadOnly: isSubmitted,
              imageUrl: form.breathAnalyser,
              onFileCapture: (file) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(breathAnalyser: file);
              },
              focusNode: focusNodes.elementAt(25),
            ),
            // PhotoSelectionWidget(
            //   borderColor: AppColors.shyMoment,
            //   title: 'Invoice/DC Image(OCR Scanning)',
            //   fileName: 'Inv_DC_Image',
            //   imageUrl: form.invoice,
            //   isRequired: true,
            //   defaultValue: form.invoiceImg.firstOrNull,
            //   onFileCapture: (file) {
            //     context
            //         .cubit<CreateGateExitCubit>()
            //         .onFieldValueChanged(invoice: file);
            //   },
            //   focusNode: focusNodes.elementAt(26),
            // ),
            MultiFileSelectionWidget(
              removeFile: context.cubit<CreateGateExitCubit>().removeFile,
              title: 'Invoice/DC Image (OCR Scanning)',
              borderColor: AppColors.shyMoment,
              initialFiles: form.invoiceImg,
              initialValue: form.addInvs,
              readOnly: isSubmitted,
              focusNode: focusNodes.elementAt(26),
              onImage: (file) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(invoice: file);
              },
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Remarks'),
            InputField(
              title: 'Remarks',
              initialValue: form.remarks,
              readOnly: isSubmitted,
              borderColor: AppColors.shyMoment,
              inputType: TextInputType.name,
              onChanged: (p0) {
                context
                    .cubit<CreateGateExitCubit>()
                    .onFieldValueChanged(remarks: p0);
              },
              focusNode: focusNodes.elementAt(27),
            ),
            const Divider(height: 1),
            const SectoinHead(title: 'Items'),
            const GateExitLinesWidget(),
            AppSpacer.p4(),
            // BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
            //   builder: (_, state) {
            //     return InputField(
            //       title: 'Total Amount',
            //       readOnly: isSubmitted,
            //       initialValue: NumUtils.inRupeesFormat(state.form.totalAmount),
            //       borderColor: AppColors.shyMoment,
            //       onChanged: (p0) {
            //         context
            //             .cubit<CreateGateExitCubit>()
            //             .onFieldValueChanged(totalAmount: double.tryParse(p0));
            //       },
            //       focusNode: focusNodes.elementAt(28),
            //     );
            //   },
            // ),
             InputField(
               title: 'Total Amount',
               readOnly: isSubmitted,
               isRequired: true,
               initialValue: NumUtils.inRupeesFormat(form.totalAmount),
               borderColor: AppColors.shyMoment,
               onChanged: (p0) {
                 context
                     .cubit<CreateGateExitCubit>()
                     .onFieldValueChanged(totalAmount: double.tryParse(p0));
               },
               focusNode: focusNodes.elementAt(28),
             ),
            AppSpacer.p8(),
            if (!isSubmitted) ...[
              BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
                builder: (context, state) {
                  return AppButton(
                    isLoading: state.isLoading,
                    onPressed:
                        context.cubit<CreateGateExitCubit>().processGateExit,
                    label: state.type.toName(),
                  );
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}
