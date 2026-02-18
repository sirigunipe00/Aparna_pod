import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/app_text_styles.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:aparna_pod/widgets/buttons/app_view_btn.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class GateEntryWidget extends StatelessWidget {
  const GateEntryWidget({
    super.key,
    required this.gateEntry,
    required this.onTap,
  });

  final PodUploadForm gateEntry;
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
              side: const BorderSide(color: AppColors.marigoldDDust, width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gateEntry.sapNo!,
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                  Text(DFU.ddMMyyyyFromStr(gateEntry.creation ?? ''),
                  
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                ],
              ),
              AppSpacer.p8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewBtn(onPressed: onTap),
                  Text(
  getFormType(gateEntry),
  style: AppTextStyles.titleLarge(context)
      .copyWith(color: AppColors.black),
),

                  // DocStatusWidget(
                  //     status: StringUtils.docStatus(gateEntry.!))
                ],
              ),
            ],
          )),
    );
  }
  String getFormType(PodUploadForm form) {

  if (form.deliveryChallanNo?.startsWith('8') ?? false) {
    return 'Delivery Challan';
  } else {
    return 'Invoice';
  }
}

}
