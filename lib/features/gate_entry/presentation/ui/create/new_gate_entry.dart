import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/create/gate_entry_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';

import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';

import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGateEntry extends StatefulWidget {
  const NewGateEntry({super.key});

  @override
  State<NewGateEntry> createState() => _NewGateEntryState();
}

class _NewGateEntryState extends State<NewGateEntry> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.watch<CreateGateEntryCubit>().state;
    final newform = gateEntryState.form;
    final status = newform.docStatus;
    // final name = newform.name;
    final isNew = gateEntryState.isNew;

    // final isNew = gateEntryState.view == GateEntryView.create;
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: isNew
      //     ? const SimpleAppBar(title: 'Proof Of Delivery')
      //     : TitleStatusAppBar(
      //         title: ' of Delivery',
      //          docNo: name.valueOrEmpty,
      //         status: StringUtils.docStatus(status ?? 0),
      //         textColor: AppColors.marigoldDDust,
      //       )
      // as PreferredSizeWidget,
      appBar: isNew
    ? const SimpleAppBar(title: 'Proof Of Delivery')
    : const TitleStatusAppBar(
        title: 'Proof of Delivery',
        docNo: '',
        status: 'Submitted', textColor: AppColors.marigoldDDust,
      ),

      body: BlocListener<CreateGateEntryCubit, CreateGateEntryState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then(
              (_) {
                //  final docName = state.form.name;
                if (!context.mounted) return;
                context.cubit<CreateGateEntryCubit>().errorHandled();

                  final gateEntryFilters =
                context.read<GateEntryFilterCubit>().state;
                context
                    .cubit<GateEntriesCubit>()
                    .fetchInitial(Pair(StringUtils.docStatusInt(gateEntryFilters.status), gateEntryFilters.query));
                         Navigator.pop(context, true);
                setState(() {});
              },
            );
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if(!context.mounted) return;
            context.cubit<CreateGateEntryCubit>().errorHandled();
          }
        },
        child: GateEntryFormWidget(key: ValueKey(status)),
      ),
    );
  }
}
