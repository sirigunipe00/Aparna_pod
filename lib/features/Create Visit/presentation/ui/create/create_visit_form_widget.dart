import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/app/widgets/section_head.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/cubit/create_visit_cubit.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/invite_visitor/model/department_form.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/photo_selection_widget.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/inputs/time_selection_field.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateVisitFormWidget extends StatefulWidget {
  const CreateVisitFormWidget({
    super.key,
  });

  @override
  State<CreateVisitFormWidget> createState() => _CreateVisitFormWidgetState();
}

class _CreateVisitFormWidgetState extends State<CreateVisitFormWidget> {
  @override
  Widget build(BuildContext context) {
    // String? loading;
    final formState = context.read<CreateVisitCubit>().state;
    final form = formState.form;
     final isCreating = formState.type == ActionType.edit;
    final isSubmitted = formState.type == ActionType.completed;

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 8,
      children: [
        const SectoinHead(title: 'Appointment Details'),
         BlocBuilder<CompanyNameList, NetworkRequestState<List<String>>>(
            builder: (_, state) {
              final names = state.maybeWhen(
                orElse: () => <String>[],
                success: (data) => data,
              );
              return SearchDropDownList(
                color: AppColors.invite,
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
                  final where = names.where((e) => e.containsIgnoreCase(p0));
                  return where.toList();
                },
                headerBuilder: (_, item, __) => Text(item),
                listItemBuilder: (_, item, __, ___) => CompactListTile(
                  title: item,
                ),
                onSelected: (names) {
                  context
                      .cubit<CreateVisitCubit>()
                      .onFieldValueChanged(plantName: names);
                },
              );
            },
          ),
        InputField(
          title: 'Scheduled Date',
          isRequired: true,
          readOnly: true,
          initialValue: form.scheduledDate,
          borderColor: AppColors.invite,
        ),
        TimeSelectionField(
          onTimeSelect: (time) {},
          readOnly: true,
          initialValue: form.scheduledTime?.split(".").firstOrNull,
          title: 'Scheduled Time',
          borderColor: AppColors.invite,
        ),
             InputField(
            title: 'Duration',
            initialValue: form.duration,
            inputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            isRequired: true,
            onChanged: (date) {
              context
                  .cubit<CreateVisitCubit>()
                  .onFieldValueChanged(duration: date);
            },
          ),
        // TimeSelectionField(
        //   readOnly: isSubmitted,
        //   initialValue: form.duration?.split(".").firstOrNull,
        //   title: 'Duration',
        //   borderColor: AppColors.invite,
        //   suffixIcon: const Icon(
        //     Icons.access_time,
        //     color: AppColors.invite,
        //   ),
        //   onTimeSelect: (time) {
        //     context.cubit<CreateVisitCubit>().onFieldValueChanged(
        //         duration: '${time.hour}:${time.minute}:00');
        //   },
        // ),
        BlocBuilder<CreateVisitCubit, CreateVisitState>(
          builder: (_, state) {
            return CheckboxListTile(
              value: state.form.multiVisit == 1,
              onChanged: isSubmitted
                  ? null
                  : (value) {
                      context.cubit<CreateVisitCubit>().onFieldValueChanged(
                          multiVisit: value == true ? 1 : 0);
                    },
              activeColor: Colors.black,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              isThreeLine: false,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Multi Visit',
                style: TextStyle(
                    color: AppColors.subtitlecolor,
                    fontWeight: FontWeight.bold),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
        const Divider(height: 1),
        const SectoinHead(title: 'Visitee Details'),
        AppDropDownWidget(
          hint: 'Select Pass Type',
          title: 'Pass Type',
          isMandatory: true,
          readOnly: isSubmitted,
          defaultSelection: form.passType,
          items: Dropdownoptions.passTypeCreate,
          onSelected: (item) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(passType: item);
          },
          color: AppColors.invite,
        ),
        InputField(
          title: 'Whom to Meet',
          isRequired: true,
          readOnly: isSubmitted,
          initialValue: form.whomToMeet,
          borderColor: AppColors.invite,
          inputFormatters: [UpperCaseTextFormatter()],
          inputType: TextInputType.name,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(whomToMeet: p0);
          },
        ),
        InputField(
          title: 'Visitee Mobile',
          borderColor: AppColors.invite,
          initialValue: form.visiteeMobileNo,
          isRequired: true,
          readOnly: isSubmitted,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          inputType: TextInputType.number,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visiteeMobileNo: p0);
          },
        ),
        InputField(
          title: 'Visitee Email',
          borderColor: AppColors.invite,
          initialValue: form.visiteeEmail,
          readOnly: isSubmitted,
          isRequired: false,
          inputType: TextInputType.emailAddress,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visiteeEmail: p0);
          },
        ),
        const Divider(height: 1),
        const SectoinHead(title: 'Visitor Details'),
        InputField(
          title: 'Name',
          initialValue: form.visitorName,
          isRequired: true,
          readOnly: isSubmitted,
          borderColor: AppColors.invite,
          inputType: TextInputType.name,
          inputFormatters: [UpperCaseTextFormatter()],
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visitorName: p0);
          },
        ),
        InputField(
          title: 'Email',
          borderColor: AppColors.invite,
          initialValue: form.visitorEmail,
          readOnly: isSubmitted,
          isRequired: true,
          inputType: TextInputType.emailAddress,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visitorEmail: p0);
          },
        ),
        InputField(
          title: 'Mobile',
          borderColor: AppColors.invite,
          initialValue: form.visitorMobile,
          isRequired: true,
          readOnly: isSubmitted,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          inputType: TextInputType.number,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visitorMobile: p0);
          },
        ),
        InputField(
          title: 'Visitor Company Name',
          readOnly: isSubmitted,
          isRequired: true,
          initialValue: form.visitorCompanyName,
          borderColor: AppColors.invite,
          inputType: TextInputType.name,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(visitorCompanyName: p0);
          },
        ),
        AppDropDownWidget(
          hint: 'Select Building Name',
          title: 'Building Name',
          isMandatory: true,
          readOnly: isSubmitted,
          defaultSelection: form.buildingName,
          items: Dropdownoptions.buildingName,
          onSelected: (item) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(buildingName: item);
          },
          color: AppColors.invite,
        ),
        BlocBuilder<DeaprtmentList, DeaprtmentListState>(
          builder: (_, state) {
            final names = state.maybeWhen(
              orElse: () => <DepartmentForm>[],
              success: (data) => data,
            );
            return SearchDropDownList(
                hint: 'Select Department',
                color: AppColors.invite,
                items: names,
                key: UniqueKey(),
                defaultSelection:
                    names.where((e) => e.name == form.department).firstOrNull,
                title: 'Department',
                readOnly: isSubmitted,
                isMandatory: true,
                isloading: state.isLoading,
                futureRequest: (p0) async {
                  final where =
                      names.where((e) => e.name.containsIgnoreCase(p0));
                  return where.toList();
                },
                headerBuilder: (_, item, __) => Text(item.name),
                listItemBuilder: (_, item, __, ___) => CompactListTile(
                      title: item.name,
                    ),
                onSelected: (names) {
                  context
                      .cubit<CreateVisitCubit>()
                      .onFieldValueChanged(department: names.name);
                });
          },
        ),
        PhotoSelectionWidget(
          fileName: 'Face Photo',
          borderColor: AppColors.invite,
          title: 'Face Photo',
          isRequired: true,
          defaultValue: form.facePhotoImg,
          isReadOnly: isSubmitted,
          imageUrl: form.facePhoto,
          onFileCapture: (file) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(facePhoto: file);
          },
        ),
        PhotoSelectionWidget(
          fileName: 'Photo ID Proof',
          borderColor: AppColors.invite,
          title: 'Photo ID Proof',
          isRequired: true,
          defaultValue: form.idPhotoImg,
          isReadOnly: isSubmitted,
          imageUrl: form.idPhoto,
          onFileCapture: (file) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(idPhoto: file);
          },
        ),
        InputField(
          title: 'ID Number',
          initialValue: form.idNumber,
          isRequired: false,
          readOnly: isSubmitted,
          borderColor: AppColors.invite,
          inputType: TextInputType.text,
          // inputFormatters: [UpperCaseTextFormatter()],
          onChanged: (p0) {
            context.cubit<CreateVisitCubit>().onFieldValueChanged(idNumber: p0);
          },
        ),
        InputField(
          title: 'Laptop Details',
          initialValue: form.laptopDetails,
          // isRequired: true,
          readOnly: isSubmitted,
          borderColor: AppColors.invite,
          inputType: TextInputType.text,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(laptopDetails: p0);
          },
        ),
        InputField(
          title: 'Other Devices Details',
          initialValue: form.otherDetails,
          // isRequired: true,
          readOnly: isSubmitted,
          borderColor: AppColors.invite,
          inputType: TextInputType.text,
          onChanged: (p0) {
            context
                .cubit<CreateVisitCubit>()
                .onFieldValueChanged(otherDetails: p0);
          },
        ),
         AppSpacer.p8(),
          if (!isSubmitted) ...[
            BlocBuilder<CreateVisitCubit, CreateVisitState>(
              builder: (_, state) => AppButton(
                label: isCreating ? 'Create' : 'Submit',
                isLoading: state.isLoading,
                bgColor: AppColors.haintBlue,
                onPressed: context.cubit<CreateVisitCubit>().processCreateVisit,
              ),
            ),
          ],
        // AppSpacer.p8(),
        // if (!isSubmitted) ...[
        //   BlocBuilder<CreateVisitCubit, CreateVisitState>(
        //     builder: (context, state) {

        //       // if (state.showApprovalButtons ||
        //       //     form.workflowState == 'Pending') {
        //       //   // return BlocBuilder<PermissionCubit, PermissionCubitState>(
        //       //   //   builder: (_, state) {
        //       //   //     final canapprove = state.maybeWhen(
        //       //   //       orElse: () => false,
        //       //   //       success: (data) => data,
        //       //   //     );
        //       //   //     // if (canapprove) {
        //       //   //     //   return Row(
        //       //   //     //     children: [
        //       //   //     //       Expanded(
        //       //   //     //         child: AppButton(
        //       //   //     //           label: 'Approve',
        //       //   //     //           isLoading:
        //       //   //     //               state.isLoading && loading == 'Approve',
        //       //   //     //           onPressed: () {
        //       //   //     //             loading = 'Approve';
        //       //   //     //             context.read<CreateVisitCubit>().approveVisit();
        //       //   //     //           },
        //       //   //     //         ),
        //       //   //     //       ),
        //       //   //     //       const SizedBox(
        //       //   //     //         width: 20,
        //       //   //     //       ),
        //       //   //     //       Expanded(
        //       //   //     //         child: AppButton(
        //       //   //     //           label: 'Reject',
        //       //   //     //           isLoading: state.isLoading && loading == "Reject",
        //       //   //     //           onPressed: () {
        //       //   //     //             loading = 'Reject';
        //       //   //     //             context.read<CreateVisitCubit>().rejectVisit();
        //       //   //     //           },
        //       //   //     //         ),
        //       //   //     //       ),
        //       //   //     //     ],
        //       //   //     //   );
        //       //   //     // } 
        //       //   //     // else {
        //       //   //     //   return const SizedBox.shrink();
        //       //   //     // }
        //       //   //     // return const SizedBox();
        //       //   //   },
        //       //   // );
        //       // } 
        //       // else {
        //       //   if (form.workflowState != 'Rejected') {
        //       //     return AppButton(
        //       //       isLoading: state.isLoading,
        //       //       onPressed:
        //       //           context.read<CreateVisitCubit>().processCreateVisit,
        //       //       label: state.type.toName(),
        //       //     );
        //       //   } else {
        //       //     return const SizedBox.shrink();
        //       //   }
        //       // }
        //     },
        //   ),
      
      ],
    );
  }

  // void _approveVisit(BuildContext context, String id, String action) {
  //   context.cubit<ApproveCubit>().request(Pair(id, action));
  // }

  // void _rejectVisit(BuildContext context, String id, String action) {
  //   context.cubit<RejectCubit>().request(Pair(id, action));
  // }
}
