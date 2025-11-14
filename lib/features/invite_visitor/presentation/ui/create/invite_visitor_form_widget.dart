import 'package:aparna_pod/app/widgets/drop_down_options.dart';
import 'package:aparna_pod/app/widgets/section_head.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/invite_visitor/model/department_form.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/cubit/create_invite_visitor_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:aparna_pod/widgets/buttons/app_btn.dart';
import 'package:aparna_pod/widgets/inputs/app_dropdown_widget.dart';
import 'package:aparna_pod/widgets/inputs/compact_listtile.dart';
import 'package:aparna_pod/widgets/inputs/date_selection_field.dart';
import 'package:aparna_pod/widgets/inputs/input_filed.dart';
import 'package:aparna_pod/widgets/inputs/search_dropdown_list.dart';
import 'package:aparna_pod/widgets/inputs/time_selection_field.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InviteVisitorFormWidget extends StatefulWidget {
  const InviteVisitorFormWidget({
    super.key,
  });

  @override
  State<InviteVisitorFormWidget> createState() =>
      _InviteVisitorFormWidgetState();
}

class _InviteVisitorFormWidgetState extends State<InviteVisitorFormWidget> {
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateInviteVisitorCubit>().state;
    final form = formState.form;
    final isSubmitted = formState.type == ActionType.completed;

    return BlocListener<InviteVisitorCubit, InviteVisitorCubitState>(
      listener: (_, state) {
        state.maybeWhen(
          orElse: () {},
          success: (data) {
            context.cubit<CreateInviteVisitorCubit>().onFieldValueChanged(
                visitorMobile: data?.visitorMobile,
                visitorName: data?.visitorName,
                visitorEmail: data?.visitorEmail,
                visitorCompanyName: data?.visitorCompanyName);
            setState(() {});
          },
        );
      },
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        margin: const EdgeInsets.all(12.0),
        defaultHeight: 8,
        children: [
          const SectoinHead(title: 'Appointment Details'),
          DateSelectionField(
              title: 'Scheduled Date',
              initialValue: form.scheduledDate,
              isRequired: true,
              firstDate: DFU.now(),
              lastDate: DFU.now().add(const Duration(days: 365)),
              onDateSelect: (date) {
                final formattedDate = DateFormat('dd-MM-yyyy')
                    .format(date); // or your desired format
                context
                    .cubit<CreateInviteVisitorCubit>()
                    .onFieldValueChanged(scheduledDate: formattedDate);
              },
              suffixIcon: const Icon(Icons.calendar_month_outlined)),
          // InputField(
          //   title: 'Scheduled Date',
          //   isRequired: true,
          //   readOnly: true,
          //   initialValue: form.scheduledDate,
          //   borderColor: AppColors.invite,
          // ),
          TimeSelectionField(
            onTimeSelect: (time) {
              final formattedTime =
                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
              context
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(scheduledTime: formattedTime);
            },
            suffixIcon: const Icon(Icons.access_alarm_outlined),
            readOnly: false,
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
                  .cubit<CreateInviteVisitorCubit>()
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
          //     context.cubit<CreateInviteVisitorCubit>().onFieldValueChanged(
          //         duration: '${time.hour}:${time.minute}:00');
          //   },
          // ),
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
                      .cubit<CreateInviteVisitorCubit>()
                      .onFieldValueChanged(plantName: names);
                },
              );
            },
          ),
          BlocBuilder<CreateInviteVisitorCubit, CreateInviteVisitorState>(
            builder: (_, state) {
              return CheckboxListTile(
                value: state.form.inviteMObile == 1,
                onChanged: isSubmitted
                    ? null
                    : (value) {
                        context
                            .cubit<CreateInviteVisitorCubit>()
                            .onFieldValueChanged(
                                inviteMObile: value == true ? 1 : 0);
                      },
                activeColor: Colors.black,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                isThreeLine: false,
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Invite to Visitor Mobile',
                  style: TextStyle(
                      color: AppColors.subtitlecolor,
                      fontWeight: FontWeight.bold),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
          ),
          BlocBuilder<CreateInviteVisitorCubit, CreateInviteVisitorState>(
            builder: (_, state) {
              return CheckboxListTile(
                value: state.form.inviteEmail == 1,
                onChanged: isSubmitted
                    ? null
                    : (value) {
                        context
                            .cubit<CreateInviteVisitorCubit>()
                            .onFieldValueChanged(
                                inviteEmail: value == true ? 1 : 0);
                      },
                activeColor: Colors.black,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                isThreeLine: false,
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Invite to Visitor Email',
                  style: TextStyle(
                      color: AppColors.subtitlecolor,
                      fontWeight: FontWeight.bold),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
          ),
          BlocBuilder<CreateInviteVisitorCubit, CreateInviteVisitorState>(
            builder: (_, state) {
              return CheckboxListTile(
                value: state.form.multiVisit == 1,
                onChanged: isSubmitted
                    ? null
                    : (value) {
                        context
                            .cubit<CreateInviteVisitorCubit>()
                            .onFieldValueChanged(
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
            items: Dropdownoptions.passType,
            onSelected: (item) {
              context
                  .cubit<CreateInviteVisitorCubit>()
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
                  .cubit<CreateInviteVisitorCubit>()
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
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visiteeMobileNo: p0);
            },
          ),
          InputField(
            title: 'Visitee Email',
            borderColor: AppColors.invite,
            initialValue: form.visiteeEmail,
            readOnly: true,
            isRequired: true,
            inputType: TextInputType.emailAddress,
            onChanged: (p0) {
              context
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visiteeEmail: p0);
            },
          ),
          const Divider(height: 1),
          const SectoinHead(title: 'Visitor Details'),
          InputField(
            title: 'Visitor Mobile',
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
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visitorMobile: p0);
              if (p0.length == 10) {
                context.cubit<InviteVisitorCubit>().request(p0);
              }
            },
          ),
          InputField(
            title: 'Visitor Name',
            initialValue: form.visitorName,
            isRequired: true,
            readOnly: isSubmitted,
            borderColor: AppColors.invite,
            inputType: TextInputType.name,
            inputFormatters: [UpperCaseTextFormatter()],
            onChanged: (p0) {
              context
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visitorName: p0);
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
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visitorCompanyName: p0);
            },
          ),
          InputField(
            title: 'Visitor Email',
            borderColor: AppColors.invite,
            initialValue: form.visitorEmail,
            readOnly: isSubmitted,
            isRequired: false,
            inputType: TextInputType.emailAddress,
            onChanged: (p0) {
              context
                  .cubit<CreateInviteVisitorCubit>()
                  .onFieldValueChanged(visitorEmail: p0);
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
                  .cubit<CreateInviteVisitorCubit>()
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
                        .cubit<CreateInviteVisitorCubit>()
                        .onFieldValueChanged(department: names.name);
                  });
            },
          ),
          AppSpacer.p8(),
          if (!isSubmitted) ...[
            BlocBuilder<CreateInviteVisitorCubit, CreateInviteVisitorState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state.isLoading,
                  onPressed: context
                      .cubit<CreateInviteVisitorCubit>()
                      .processInviteVisitor,
                  label: state.type.toName(),
                );
              },
            )
          ]
        ],
      ),
    );
  }
}
