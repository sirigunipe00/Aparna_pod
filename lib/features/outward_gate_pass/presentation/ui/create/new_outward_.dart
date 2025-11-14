import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/cubit/create_outward_cubit.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/ouward_filter_cubit.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/ui/create/outward_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOutWardGatePass extends StatefulWidget {
  const NewOutWardGatePass({
    super.key,
  });

  @override
  State<NewOutWardGatePass> createState() => _NewOutWardGatePassState();
}

class _NewOutWardGatePassState extends State<NewOutWardGatePass> {
  @override
  Widget build(BuildContext context) {
    final gateExitState = context.read<CreateOutwardCubit>().state;
    final form = gateExitState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Outward Gate Pass')
          : TitleStatusAppBar(
              title: 'Outward Gate Pass',
              status: StringUtils.docStatus(status),
              textColor: AppColors.shyMoment,
              docNo: name.valueOrEmpty,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateOutwardCubit, CreateOutwardState>(
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
                context.cubit<CreateOutwardCubit>().handled();
                context.cubit<OutwardLinesCubit>().request(docName);
                final gateExitFilters =
                    context.read<OutwardFilterCubit>().state;
                context.cubit<OutwardListCubit>().fetchInitial(Pair(
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
            context.cubit<CreateOutwardCubit>().handled();
          }
        },
        child: OutwardFormWidget(
          key: ValueKey(status),
        ),
      ),
    );
  }
}
