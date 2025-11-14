import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_cubit/create_empty_vehicle_cubit.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_filter_cubit.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/ui/create/empty_vehicle_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewEmptyVehicleTracking extends StatefulWidget {
  const NewEmptyVehicleTracking({super.key});

  @override
  State<NewEmptyVehicleTracking> createState() => _NewEmptyVehicleTracking();
}

class _NewEmptyVehicleTracking extends State<NewEmptyVehicleTracking> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateEmptyVehicleCubit>().state;
    final newform = gateEntryState.form;
    final status = newform.docStatus;
    final name = newform.name;

    final isNew = gateEntryState.view == EmptyVehicleView.create;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Empty Vehicle Tracking')
          : TitleStatusAppBar(
              title: 'Empty Vehicle Tracking',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.incident,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateEmptyVehicleCubit,
          CreateEmptyVehicleState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then((_) {
              if (!context.mounted) return;
              context.cubit<CreateEmptyVehicleCubit>().errorHandled();
              final filters = context.read<EmptyVehicleFilterCubit>().state;
              context.cubit<EmptyVehicleListCubit>().fetchInitial(Pair(
                  StringUtils.docStatusInt(filters.status), filters.query));
              setState(() {});
            });
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateEmptyVehicleCubit>().errorHandled();
            return;
          }
        },
        child: SingleChildScrollView(
          child: EmptyVehicleFormWidget(key: ValueKey(status)),
        ),
      ),
    );
  }
 
}
