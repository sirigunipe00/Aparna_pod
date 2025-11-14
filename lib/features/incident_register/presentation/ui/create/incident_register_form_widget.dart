import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/create_incident_register/incident_register_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentRegisterFrmWidget extends StatefulWidget {
  const IncidentRegisterFrmWidget({super.key});

  @override
  State<IncidentRegisterFrmWidget> createState() =>
      _IncidentRegisterFrmWidgetState();
}

class _IncidentRegisterFrmWidgetState extends State<IncidentRegisterFrmWidget> {
  final ScrollController _scrollController = ScrollController();
  final focusNodes = List.generate(30, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateIncidentRegisterCubit>().state;
    final isCreating = formState.view == IncidentRegisterView.create;
    final isCompleted = formState.view == IncidentRegisterView.completed;
    final newform = formState.form;
    return BlocListener<CreateIncidentRegisterCubit,
        CreateIncidentRegisterState>(
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
      child: SingleChildScrollView(
        controller: _scrollController,
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          children: [
            InputField(
              readOnly: true,
              initialValue: newform.date,
              title: 'Date',
              isRequired: true,
              borderColor: AppColors.incident,
              onChanged: (p0) {},
              focusNode: focusNodes.elementAt(0),
            ),
            InputField(
              readOnly: true,
              initialValue: StringUtils.trimTime(newform.time),
              title: 'Time',
              isRequired: true,
              borderColor: AppColors.incident,
              onChanged: (p0) {},
              focusNode: focusNodes.elementAt(1),
            ),
            InputField(
              title: 'Incident Investigator ( RSM Name )',
              isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.incidentInvestigator,
              borderColor: AppColors.incident,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(incIvestigator: p0);
              },
              focusNode: focusNodes.elementAt(2),
            ),
            BlocBuilder<CompanyNameList, NetworkRequestState<List<String>>>(
              builder: (_, state) {
                final names = state.maybeWhen(
                  orElse: () => <String>[],
                  success: (data) => data,
                );
                return SearchDropDownList(
                  color: AppColors.incident,
                  closedFillColor: AppColors.incident,
                  isMandatory: true,
                  items: names,
                  key: UniqueKey(),
                  defaultSelection: names
                      .where((e) => e == newform.incidentPlantName)
                      .firstOrNull,
                  title: 'Incident Plant Name',
                  hint: 'Select Plant Name',
                  readOnly: isCompleted,
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
                        .cubit<CreateIncidentRegisterCubit>()
                        .onValueChanged(incPlantName: names);
                  },
                  focusNode: focusNodes.elementAt(3),
                );
              },
            ),
            BlocBuilder<IncidentTypeList, NetworkRequestState<List<String>>>(
              builder: (_, state) {
                final names = state.maybeWhen(
                  orElse: () => <String>[],
                  success: (data) => data,
                );
                return SearchDropDownList(
                  color: AppColors.incident,
                  hint: 'Select Incident Type',
                  isMandatory: true,
                  items: names,
                  key: UniqueKey(),
                  defaultSelection: names
                      .where((e) => e == newform.incidentType)
                      .firstOrNull,
                  title: 'Type of Incident',
                  readOnly: isCompleted,
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
                        .cubit<CreateIncidentRegisterCubit>()
                        .onValueChanged(incidentType: names);
                  },
                  focusNode: focusNodes.elementAt(4),
                );
              },
            ),
            AppDropDownWidget(
              isMandatory: true,
              defaultSelection: newform.associatedInvol,
              readOnly: isCompleted,
              title: 'AEL Associated Involved',
              items: const ['Yes', 'No'],
              onSelected: (item) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(aelAssInvolve: item);
              },
              color: AppColors.incident,
              focusNode: focusNodes.elementAt(5),
            ),
            AppDropDownWidget(
              isMandatory: true,
              defaultSelection: newform.assetsInvolve,
              title: 'AEL Assets Involved',
              readOnly: isCompleted,
              items: const ['Yes', 'No'],
              onSelected: (item) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(aelAssetInvolve: item);
              },
              color: AppColors.incident,
              focusNode: focusNodes.elementAt(6),
            ),
            InputField(
              readOnly: isCompleted,
              isRequired: true,
              initialValue: NumUtils.toDoubleStr(newform.amount),
              inputType: TextInputType.number,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(amount: int.tryParse(p0));
              },
              title: 'Amount of Compensation Paid by AEL',
              focusNode: focusNodes.elementAt(7),
              borderColor: AppColors.incident,
            ),
            AppDropDownWidget(
              isMandatory: true,
              defaultSelection: newform.complaint,
              readOnly: isCompleted,
              title: 'FIR - Complaint',
              hint: 'Select FIR Complaint',
              items: const ['Yes', 'No'],
              onSelected: (item) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(firComplaint: item);
              },
              color: AppColors.incident,
              focusNode: focusNodes.elementAt(8),
            ),
            InputField(
              isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.employeeEmail,
              inputType: TextInputType.emailAddress,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(employeeEmail: p0);
              },
              title: 'Notify Employee Email',
              focusNode: focusNodes.elementAt(9),
              borderColor: AppColors.incident,
            ),
            PhotoSelectionWidget(
              fileName: 'Incident_Photo',
              borderColor: AppColors.incident,
              isRequired: true,
              isWarning: true,
              isReadOnly: isCompleted,
              defaultValue: newform.incPhotoImg,
              imageUrl: newform.photo,
              title: 'Photographs of Incident',
              onFileCapture: (file) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(incPhoto: file);
              },
              focusNode: focusNodes.elementAt(10),
            ),
            InputField(
              isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.otherPartyDetails,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(partyDetails: p0);
              },
              title: 'Details of Other Party',
              focusNode: focusNodes.elementAt(11),
              borderColor: AppColors.incident,
            ),
            InputField(
              isRequired: true,
              readOnly: isCompleted,
              minLines: 3,
              initialValue: newform.desc2,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(descr2: p0);
              },
              title: 'Incident Description ',
              focusNode: focusNodes.elementAt(12),
              borderColor: AppColors.incident,
            ),
            InputField(
              isRequired: true,
              readOnly: isCompleted,
              minLines: 3,
              initialValue: newform.desc3,
              onChanged: (p0) {
                context
                    .cubit<CreateIncidentRegisterCubit>()
                    .onValueChanged(descr3: p0);
              },
              title: 'Action taken/Recommendation',
              focusNode: focusNodes.elementAt(13),
             borderColor: AppColors.incident, 
            ),
            AppSpacer.p8(),
            if (!isCompleted) ...[
              BlocBuilder<CreateIncidentRegisterCubit,
                  CreateIncidentRegisterState>(
                builder: (_, state) => AppButton(
                  label: isCreating ? 'Create' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  onPressed: context.cubit<CreateIncidentRegisterCubit>().save,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
