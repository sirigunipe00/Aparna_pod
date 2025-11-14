import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/create_visit_filter_cubit.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/cubit/create_visit_cubit.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/ui/create/create_visit_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCreateVisit extends StatefulWidget {
  const NewCreateVisit({
    super.key,
  });

  @override
  State<NewCreateVisit> createState() => _NewCreateVisitState();
}

class _NewCreateVisitState extends State<NewCreateVisit> {
  @override
  Widget build(BuildContext context) {
    final createVisitState = context.read<CreateVisitCubit>().state;
    final form = createVisitState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Create Visit')
          : TitleStatusAppBar(
              title: 'Create Visit',
              status: StringUtils.docStatus(status),
              textColor: AppColors.invite,
              docNo: name.valueOrEmpty
            ) as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: BlocListener<CreateVisitCubit, CreateVisitState>(
          listener: (context, state) async {
            if (state.isSuccess && state.successMsg.isNotNull) {
              AppDialog.showSuccessDialog(
                context,
                title: 'Success',
                content: state.successMsg.valueOrEmpty,
                onTapDismiss: context.exit,
              ).then(
                (_) {
                  if (!context.mounted) return;
                  context.cubit<CreateVisitCubit>().handled();

                  final visitorFilters =
                      context.read<CreateVisitFilterCubit>().state;
                  context.cubit<CreateVisitListCubit>().fetchInitial(Pair(
                        (visitorFilters.status),
                        visitorFilters.query,
                      ));
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
              context.cubit<CreateVisitCubit>().handled();
            }
          },
          child: CreateVisitFormWidget(
            key: ValueKey(status),
          ),
        ),
      ),
    );
  }
  //  String _extractId(String? name) {
  //   // Regular expression to capture the ID
  //   RegExp regExp = RegExp(r'ID\s+([A-Za-z0-9\-]+)');
  //   Match? match = regExp.firstMatch(name.valueOrEmpty);

  //   if (match != null) {
  //     return match.group(1) ?? '';
  //   }
  //   return ''; // Return empty string if ID not found
  // }
  
}
