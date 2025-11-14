import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/cubit/create_invite_visitor_cubit.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/invite_visitor_filter_cubit.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/ui/create/invite_visitor_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewInviteVisitor extends StatefulWidget {
  const NewInviteVisitor({
    super.key,
  });

  @override
  State<NewInviteVisitor> createState() => _NewInviteVisitorState();
}

class _NewInviteVisitorState extends State<NewInviteVisitor> {
  @override
  Widget build(BuildContext context) {
    final iniviteVisitorState = context.read<CreateInviteVisitorCubit>().state;
    final form = iniviteVisitorState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Invite Visitor')
          : TitleStatusAppBar(
              title: 'Invite Visitor',
              status: StringUtils.docStatus(status),
              textColor: AppColors.invite,
              docNo: name.valueOrEmpty,
            ) as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: BlocListener<CreateInviteVisitorCubit, CreateInviteVisitorState>(
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
                   context.cubit<CreateInviteVisitorCubit>().handled();

                   final visitorFilters =
                  context.read<InviteVisitorFilterCubit>().state;
                  context
                      .cubit<InviteVisitorListCubit>()
                      .fetchInitial( Pair(StringUtils.docStatusInt(visitorFilters.status),visitorFilters.query,));
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
              if(!context.mounted) return;
              context.cubit<CreateInviteVisitorCubit>().handled();
            }
          },
          child:  InviteVisitorFormWidget(key: ValueKey(status),),
        ),
      ),
      
    );
  }

  
}
