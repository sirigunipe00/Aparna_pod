import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/cubit/create_visitor_in_out_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:aparna_pod/widgets/buttons/app_btn.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/inputs/input_filed.dart';
import 'package:aparna_pod/widgets/inputs/time_selection_field.dart';
import 'package:aparna_pod/widgets/loading_indicator.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class VisitorInOutFormWidget extends StatefulWidget {
  const VisitorInOutFormWidget({super.key});

  @override
  State<VisitorInOutFormWidget> createState() => _VisitorInOutFormWidgetState();
}

class _VisitorInOutFormWidgetState extends State<VisitorInOutFormWidget> {
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateVisitorInOutCubit>().state;
    final form = formState.form;
    final isCreating = formState.type == ActionType.edit;
    final isSubmitted = formState.type == ActionType.completed;

    return BlocListener<FetchVisitorsCubit, FetchVisitorsCubitState>(
      listener: (_, state) {
        state.maybeWhen(
          orElse: () {},
          failure: (failure) {
            AppDialog.showErrorDialog(
              context,
              title: failure.title,
              content: failure.error,
              onTapDismiss: context.exit,
            );
            context.cubit<CreateVisitorInOutCubit>().reset();
            setState(() {});
          },
          success: (data) {
            context.cubit<CreateVisitorInOutCubit>().onFieldValueChanged(
                  inviteVisitor: data.name,
                  qrScanner: data.name,
                  visitorEmail: data.visitorEmail,
                  visitorMobile: data.visitorMobile,
                  visitorName: data.visitorName,
                  buildingName: data.buildingName,
                  department: data.department,
                  passType: data.passType,
                  visiteeEmail: data.visiteeEmail,
                  visiteeMobileNo: data.visiteeMobileNo,
                  visitorCompanyName: data.visitorCompanyName,
                  whomToMeet: data.whomToMeet,
                  plantName: data.plantName,
                );
            setState(() {});
          },
        );
      },
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        margin: const EdgeInsets.all(12.0),
        defaultHeight: 8,
        children: [
          InputField(
              title: 'Qr Scanner',
              readOnly: true,
              isRequired: true,
              initialValue: form.qrScanner,
              borderColor: AppColors.registration,
              suffixIcon: isSubmitted ? null : const IconButtonWidget()),
          InputField(
            title: 'Plant Name',
            initialValue: form.plantName,
            isRequired: true,
            readOnly: true,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(plantName: p0);
            },
          ),
          InputField(
            title: 'Pass Type',
            initialValue: form.passType,
            readOnly: true,
            isRequired: false,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(passType: p0);
            },
          ),
          InputField(
            title: 'Whom to Meet',
            isRequired: false,
            readOnly: true,
            initialValue: form.whomToMeet,
            borderColor: AppColors.registration,
            inputFormatters: [UpperCaseTextFormatter()],
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(whomToMeet: p0);
            },
          ),
          InputField(
            title: 'Building Name',
            initialValue: form.buildingName,
            readOnly: true,
            isRequired: false,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(buildingName: p0);
            },
          ),
          InputField(
            title: 'Visitor Name',
            initialValue: form.visitorName?.toUpperCase(),
            readOnly: true,
            isRequired: false,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visitorName: p0);
            },
          ),
          InputField(
            title: 'Visitor Company Name',
            readOnly: true,
            isRequired: false,
            initialValue: form.visitorCompanyName,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visitorCompanyName: p0);
            },
          ),
          InputField(
            title: 'Department',
            initialValue: form.department,
            readOnly: true,
            isRequired: false,
            borderColor: AppColors.registration,
            inputType: TextInputType.name,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(department: p0);
            },
          ),
          InputField(
            title: 'Visitor Mobile',
            borderColor: AppColors.registration,
            initialValue: form.visitorMobile,
            readOnly: true,
            maxLength: 10,
            isRequired: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            inputType: TextInputType.number,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visitorMobile: p0);
            },
          ),
          InputField(
            title: 'Visitor Email',
            borderColor: AppColors.registration,
            initialValue: form.visitorEmail,
            readOnly: true,
            inputType: TextInputType.emailAddress,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visitorEmail: p0);
            },
          ),
          InputField(
            title: 'Visitee Email',
            borderColor: AppColors.registration,
            initialValue: form.visiteeEmail,
            readOnly: true,
            isRequired: false,
            inputType: TextInputType.emailAddress,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visiteeEmail: p0);
            },
          ),
          InputField(
            title: 'Visitee Mobile',
            borderColor: AppColors.registration,
            initialValue: form.visiteeMobileNo,
            isRequired: false,
            readOnly: true,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            inputType: TextInputType.number,
            onChanged: (p0) {
              context
                  .cubit<CreateVisitorInOutCubit>()
                  .onFieldValueChanged(visiteeMobileNo: p0);
            },
          ),
          TimeSelectionField(
            onTimeSelect: (time) {},
            isRequired: true,
            initialValue: form.visitorInTime?.split(".").firstOrNull,
            title: 'Visitor In Time',
            readOnly: isSubmitted,
            borderColor: AppColors.registration,
          ),
          if (form.docstatus == 0 || form.docstatus == 1) ...[
            TimeSelectionField(
              onTimeSelect: (time) {
                final formattedTime = '${time.hour.toString().padLeft(2, '0')}:'
                    '${time.minute.toString().padLeft(2, '0')}:00';
                context
                    .cubit<CreateVisitorInOutCubit>()
                    .onFieldValueChanged(visitorExitTime: formattedTime);
              },
              initialValue: form.visitorExitTime?.split(".").firstOrNull,
              title: 'Visitor Out Time',
              isRequired: true,
              readOnly: isSubmitted,
              borderColor: AppColors.registration,
            ),
          ],
          AppSpacer.p8(),
          if (!isSubmitted && !isCreating) ...[
            BlocBuilder<CreateVisitorInOutCubit, CreateVisitorInOutState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state.isLoading,
                  onPressed: context
                      .cubit<CreateVisitorInOutCubit>()
                      .processVisitorInOut,
                  label: 'Submit',
                );
              },
            )
          ]
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // IconButton(
    //   onPressed: () => onScan(context),
    //   icon: const Icon(
    //     Icons.document_scanner_outlined,
    //     color: AppColors.chimneySweep,
    //   ),
    // );

    BlocBuilder<CreateVisitorInOutCubit, CreateVisitorInOutState>(
      builder: (_, state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }
        return IconButton(
          onPressed: () => onScan(context),
          icon: const Icon(
            Icons.document_scanner_outlined,
            color: AppColors.chimneySweep,
          ),
        );
      },
    );
  }

  void onScan(BuildContext context) async {
    String? barcodeScanRes = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Test',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
      scanType: ScanType.barcode,
      cameraFace: CameraFace.back,
    );

    final isValid = barcodeScanRes.containsValidValue && barcodeScanRes != '-1';
    if (isValid && context.mounted) {
      context
          .cubit<CreateVisitorInOutCubit>()
          .onFieldValueChanged(qrScanner: barcodeScanRes);

      context.cubit<CreateVisitorInOutCubit>().createVisitorInOut();
    }
  }
}
