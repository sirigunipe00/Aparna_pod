import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/cubit/create_gate_exit_cubit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/gate_exit_filter_cubit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/ui/create/gate_exit_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGateExit extends StatefulWidget {
  const NewGateExit({
    super.key,
  });

  @override
  State<NewGateExit> createState() => _NewGateExitState();
}

class _NewGateExitState extends State<NewGateExit> {
  @override
  Widget build(BuildContext context) {
    final gateExitState = context.read<CreateGateExitCubit>().state;
    final form = gateExitState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Gate Exit')
          : TitleStatusAppBar(
              title: 'Gate Exit',
              status: StringUtils.docStatus(status),
              textColor: AppColors.shyMoment,
              docNo: name.valueOrEmpty,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateGateExitCubit, CreateGateExitState>(
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
                context.cubit<CreateGateExitCubit>().handled();
                context.cubit<GateExitLinesCubit>().request(docName);
                final gateExitFilters =
                    context.read<GateExitFilterCubit>().state;
                context.cubit<GateExitListCubit>().fetchInitial(Pair(
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
            context.cubit<CreateGateExitCubit>().handled();
          }
        },
        child: GateExitFormWidget(
          key: ValueKey(status),
        ),
      ),
    );
  }
}
