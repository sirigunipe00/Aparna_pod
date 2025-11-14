import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/create_incident_register/incident_register_cubit.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/incident_register_filter_cubit.dart';
import 'package:aparna_pod/features/incident_register/presentation/ui/create/incident_register_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIncidentRegister extends StatefulWidget {
  const NewIncidentRegister({super.key});

  @override
  State<NewIncidentRegister> createState() => _NewGateEntryState();
}

class _NewGateEntryState extends State<NewIncidentRegister> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateIncidentRegisterCubit>().state;
    final newform = gateEntryState.form;
    final status = newform.docStatus;
    final name = newform.name;

    final isNew = gateEntryState.view == IncidentRegisterView.create;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Incident Registration')
          : TitleStatusAppBar(
              title: 'Incident Registration',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.incident,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateIncidentRegisterCubit,
          CreateIncidentRegisterState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then((_) {
              if (!context.mounted) return;
              context.cubit<CreateIncidentRegisterCubit>().errorHandled();
              final filters = context.read<IncidentRegisterFilterCubit>().state;
              context.cubit<IncidentRegistersListCubit>().fetchInitial(Pair(
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
            context.cubit<CreateIncidentRegisterCubit>().errorHandled();
            return;
          }
        },
        child: SingleChildScrollView(
          child: IncidentRegisterFrmWidget(key: ValueKey(status)),
        ),
      ),
    );
  }
}
