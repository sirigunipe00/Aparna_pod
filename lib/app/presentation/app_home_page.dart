
import 'package:aparna_pod/app/widgets/app_feature_widget.dart';
import 'package:aparna_pod/app/widgets/app_page_view.dart';
import 'package:aparna_pod/core/app_router/app_route.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/app_text_styles.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:flutter/material.dart';


class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      mode: PageMode.home,
      // child: BlocListener<AppVersionCubit, AppVersionCubitState>(
      //   listener: (context, state) {
      //       state.maybeWhen(
      //       orElse: () {},
      //       success: (data) {
      //         if (data) {
      //           showDialog(
      //               context: context,
      //               builder: (ctx) => const AppUpdateDialog(
      //                   appName: 'Aparna Enterprises',
      //                   packageName: 'in.easycloud.aparna_pod'),
      //               barrierDismissible: false);
      //         }
      //       },
      //     );
      //   },
        child: GridView.count(
          padding: const EdgeInsets.all(12.0),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 1,
          children: [
            
            AppFeatureWidget(
              icon: AppIcons.vechileEntry
                  .toWidget(height: 100, width: 120, fit: BoxFit.contain),
              title: Text('Proof Of Delivery',
                  style: AppTextStyles.featureLabelStyle(context)),
              featureColor: AppColors.marigoldDDust,
              onTap: () => AppRoute.gateEntry.push(context),
            ),
            // AppFeatureWidget(
            //   icon: AppIcons.vehcileExit
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: Text('Gate Exit',
            //       style: AppTextStyles.featureLabelStyle(context)),
            //   featureColor: AppColors.shyMoment,
            //   onTap: () => AppRoute.gateExit.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.incidentRegistration
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: FittedBox(
            //     child: Text('Incident Register',
            //         style: AppTextStyles.featureLabelStyle(context)),
            //   ),
            //   featureColor: const Color(0xFFC0C0C0),
            //   onTap: () => AppRoute.incidentRegister.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.inviteVisitor.toWidget(height: 100, width: 120),
            //   title: Text('Invite Visitor',
            //       style: AppTextStyles.featureLabelStyle(context)),
            //   featureColor: AppColors.invite,
            //   onTap: () => AppRoute.inviteVisitor.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.visitorInOut
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: Text('Visitor In Out',
            //       style: AppTextStyles.featureLabelStyle(context)),
            //   featureColor: AppColors.registration,
            //   onTap: () => AppRoute.visitorInOut.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.inviteVisitor.toWidget(height: 100, width: 120),
            //   title: Text('Create Visit',
            //       style: AppTextStyles.featureLabelStyle(context)),
            //   featureColor: AppColors.invite,
            //   // onTap: (){},
            //   onTap: () => AppRoute.createVisit.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.vehcileExit
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: FittedBox(
            //     child: Text('Outward Gate Pass',
            //         style: AppTextStyles.featureLabelStyle(context)),
            //   ),
            //   featureColor: AppColors.shyMoment,
            //   onTap: () => AppRoute.outWardGatePass.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.vechileEntry
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: Text('Inward Gate Pass',
            //       style: AppTextStyles.titleMedium(context, AppColors.black)),
            //   featureColor: AppColors.marigoldDDust,
            //   onTap: () => AppRoute.inWardGatePass.push(context),
            // ),
            // AppFeatureWidget(
            //   icon: AppIcons.visitorInOut
            //       .toWidget(height: 100, width: 120, fit: BoxFit.contain),
            //   title: FittedBox(
            //     child: Text('Empty Vehicle Tracking',
            //         style: AppTextStyles.featureLabelStyle(context)),
            //   ),
            //   featureColor: AppColors.registration,
            //   onTap: () => AppRoute.emptyVehicle.push(context),
            // ),
          ],
        ),
      );
    // );
  }
}
