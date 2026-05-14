
import 'package:aparna_pod/app/presentation/app_update_blocprovider.dart';
import 'package:aparna_pod/app/widgets/app_feature_widget.dart';
import 'package:aparna_pod/app/widgets/app_page_view.dart';
import 'package:aparna_pod/app/widgets/app_update_dailog.dart';
import 'package:aparna_pod/core/app_router/app_route.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/app_text_styles.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      mode: PageMode.home,
      child: BlocListener<AppVersionCubit, AppVersionCubitState>(
        listener: (context, state) {
            state.maybeWhen(
            orElse: () {},
            success: (data) {
              if (data) {
                showDialog(
                    context: context,
                    builder: (ctx) => const AppUpdateDialog(
                        appName: 'Aparna POD',
                        packageName: 'in.easycloud.aparna_pod'),
                    barrierDismissible: false);
              }
            },
          );
        },
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
        ],
        ),
      ),
    );
  }
}
