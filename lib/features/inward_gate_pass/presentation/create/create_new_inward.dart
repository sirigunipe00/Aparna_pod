import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/cubit/create_inward_cubit.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/inWard_filter_cubit.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/create/inward_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewInWardGatePass extends StatefulWidget {
  const CreateNewInWardGatePass({
    super.key,
  });

  @override
  State<CreateNewInWardGatePass> createState() => _CreateNewInWardGatePassState();
}

class _CreateNewInWardGatePassState extends State<CreateNewInWardGatePass> {
  @override
  Widget build(BuildContext context) {
    final gateExitState = context.read<CreateInwardCubit>().state;
    final form = gateExitState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Inward Gate Pass')
          : TitleStatusAppBar(
              title: 'Inward Gate Pass',
              status: StringUtils.docStatus(status),
              textColor: AppColors.shyMoment,
              docNo: name.valueOrEmpty,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateInwardCubit, CreateInwardState>(
        listener: (context, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then(
              (_) {
                final docName = state.form.name;
                if (!context.mounted) return;
                context.cubit<CreateInwardCubit>().handled();
                context.cubit<InwardLinesCubit>().request(docName);
                final gateExitFilters =
                    context.read<InwardFilterCubit>().state;
                context.cubit<InwardListCubit>().fetchInitial(Pair(
                    StringUtils.docStatusInt(gateExitFilters.status),
                    gateExitFilters.query));
                setState(() {});
              },
            );
          }

          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.error,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateInwardCubit>().handled();
          }
        },
        child: InwardFormWidget(
          key: ValueKey(status),
        ),
      ),
    );
  }
}
