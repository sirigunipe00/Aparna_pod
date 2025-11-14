import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/app_text_styles.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:aparna_pod/widgets/buttons/app_view_btn.dart';
import 'package:aparna_pod/widgets/doc_status_widget.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class GateExitWidget extends StatelessWidget {
  const GateExitWidget({
    super.key,
    required this.gateExit,
    required this.onTap,
  });

  final GateExitForm gateExit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: AppColors.shyMoment, width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gateExit.name.valueOrEmpty,
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                          Text(DFU.ddMMyyyyFromStr(gateExit.creationDate!),
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                ],
              ),
              AppSpacer.p8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewBtn(onPressed: onTap),
                  DocStatusWidget(
                      status: StringUtils.docStatus(gateExit.docstatus!))
                ],
              ),
            ],
          )),
    );
  }
}
