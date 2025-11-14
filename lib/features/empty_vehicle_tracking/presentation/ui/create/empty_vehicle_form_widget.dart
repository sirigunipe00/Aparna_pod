import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_cubit/create_empty_vehicle_cubit.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyVehicleFormWidget extends StatefulWidget {
  const EmptyVehicleFormWidget({super.key});

  @override
  State<EmptyVehicleFormWidget> createState() => _EmptyVehicleFormWidgetState();
}

class _EmptyVehicleFormWidgetState extends State<EmptyVehicleFormWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateEmptyVehicleCubit>().state;
    final isCreating = formState.view == EmptyVehicleView.create;
    final isCompleted = formState.view == EmptyVehicleView.completed;
    final newform = formState.form;
    return SingleChildScrollView(
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
                color: AppColors.registration,
                closedFillColor: AppColors.registration,
                isMandatory: true,
                items: names,
                key: UniqueKey(),
                defaultSelection:
                    names.where((e) => e == newform.company).firstOrNull,
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
                      .cubit<CreateEmptyVehicleCubit>()
                      .onValueChanged(company: names);
                },
              );
            },
          ),
          AppDropDownWidget(
            isMandatory: true,
            defaultSelection: newform.gateMomentType,
            readOnly: isCompleted,
            title: 'Gate Movement Type',
            hint: 'Select Gate Movement Type ',
            items: const ['Gate Entry', 'Gate Exit'],
            onSelected: (item) {
              context
                  .cubit<CreateEmptyVehicleCubit>()
                  .onValueChanged(gateMomentType: item);
            },
            color: AppColors.registration,
          ),
          AppDropDownWidget(
            isMandatory: true,
            defaultSelection: newform.vehicleType,
            readOnly: isCompleted,
            title: 'Vehicle Type',
            hint: 'Select Vehicle Type ',
            items: Dropdownoptions.vehicleTypeEmpty,
            onSelected: (item) {
              context
                  .cubit<CreateEmptyVehicleCubit>()
                  .onValueChanged(vehicleType: item);
            },
            color: AppColors.registration,
          ),
          InputField(
            readOnly: true,
            initialValue: newform.date,
            title: 'Date',
            isRequired: true,
            borderColor: AppColors.registration,
            onChanged: (p0) {},
          ),
          InputField(
            readOnly: true,
            initialValue: StringUtils.trimTime(newform.time),
            title: 'Time',
            isRequired: true,
            borderColor: AppColors.registration,
            onChanged: (p0) {},
          ),
          BlocBuilder<SupplierNameList, SupplierNameListState>(
            builder: (_, state) {
              final names = state.maybeWhen(
                orElse: () => <SupplierNameForm>[],
                success: (data) => data,
              );
              return SearchDropDownList(
                color: AppColors.registration,
                items: names,
                key: UniqueKey(),
                defaultSelection: names
                    .where((e) => e.name == newform.transporterList)
                    .firstOrNull,
                title: 'Transporter List',
                hint: 'Select Transporter',
                readOnly: isCompleted,
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
                      .cubit<CreateEmptyVehicleCubit>()
                      .onValueChanged(transporterList: names.name);
              setState(() {});

                },
              );
            },
          ),
               InputField(
              readOnly: isCompleted,
              initialValue: newform.vehicleNo,
              title: 'Vehicle Number',
              isRequired: true,
              borderColor: AppColors.registration,
              maxLength: 10,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              suffixIcon: const Icon(Icons.pin_outlined),
              onChanged: (vehicleNo) {
                context
                    .cubit<CreateEmptyVehicleCubit>()
                    .onValueChanged(vehicleNo: vehicleNo);
              },
            ),
          InputField(
            isRequired: true,
            readOnly: isCompleted,
            initialValue: newform.driveName,
            onChanged: (p0) {
              context
                  .cubit<CreateEmptyVehicleCubit>()
                  .onValueChanged(driveName: p0);
            },
            title: 'Driver Name',
            borderColor: AppColors.registration,
          ),
          InputField(
            isRequired: true,
            readOnly: isCompleted,
            initialValue: newform.driverMobileNumber,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            inputType: TextInputType.number,
            onChanged: (p0) {
              context
                  .cubit<CreateEmptyVehicleCubit>()
                  .onValueChanged(driverMobileNumber: p0);
            },
            title: 'Driver Phone Number ',
            borderColor: AppColors.registration,
          ),
          PhotoSelectionWidget(
            fileName: 'Vehicle Photo',
            borderColor: AppColors.registration,
            isRequired: true,
            isReadOnly: isCompleted,
            defaultValue: newform.vehicleImg,
            imageUrl: newform.vehiclePhoto,
            title: 'Vehicle Photo',
            onFileCapture: (file) {
              context
                  .cubit<CreateEmptyVehicleCubit>()
                  .onValueChanged(vehiclePhoto: file);
            },
          ),
            InputField(
              // isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.remarks,
              inputType: TextInputType.text,
              onChanged: (p0) {
                context
                    .cubit<CreateEmptyVehicleCubit>()
                    .onValueChanged(remarks: p0);
              },
              title: 'Remarks',
              borderColor: AppColors.registration,
            ),
          AppSpacer.p8(),
          if (!isCompleted) ...[
            BlocBuilder<CreateEmptyVehicleCubit, CreateEmptyVehicleState>(
              builder: (_, state) => AppButton(
                label: isCreating ? 'Create' : 'Submit',
                isLoading: state.isLoading,
                bgColor: AppColors.haintBlue,
                onPressed: context.cubit<CreateEmptyVehicleCubit>().save,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
