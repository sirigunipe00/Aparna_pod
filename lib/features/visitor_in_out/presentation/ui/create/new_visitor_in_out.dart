import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/cubit/create_visitor_in_out_cubit.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/visitor_in_out_filter_cubit.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/ui/create/visitor_in_out_form_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/simple_app_bar.dart';
import 'package:aparna_pod/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewVisitorInOut extends StatefulWidget {
  const NewVisitorInOut({
    super.key,
  });

  @override
  State<NewVisitorInOut> createState() => _NewVisitorInOutState();
}

class _NewVisitorInOutState extends State<NewVisitorInOut> {
  @override
  Widget build(BuildContext context) {
    final visitorInOutState = context.read<CreateVisitorInOutCubit>().state;
    final form = visitorInOutState.form;
    final status = form.docstatus;
    final name = form.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: status == null
          ? const SimpleAppBar(title: 'New Visitor In Out Register')
          : TitleStatusAppBar(
              title: 'Visitor In Out Regist',
              status: StringUtils.docStatus(status),
              textColor: AppColors.registration,
              docNo: name.valueOrEmpty,
            ) as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: 
        BlocListener<CreateVisitorInOutCubit, CreateVisitorInOutState>(
          listener: (context, state) async {
            if (state.successMsg.isNotNull) {
              context.cubit<FetchVisitorsCubit>().request(state.form.name);
              AppDialog.showSuccessDialog(
                context,
                title: 'Success',
                content: state.successMsg.valueOrEmpty,
                onTapDismiss: context.exit,
              );


               if(!context.mounted) return;
              context.cubit<CreateVisitorInOutCubit>().handled();

                    final inOutFilters =
                  context.read<VisitorInOutFilterCubit>().state;
                  context
                      .cubit<VisitorInOutListCubit>()
                      .fetchInitial(Pair((StringUtils.docStatusInt(inOutFilters.status)), inOutFilters.query));
              // .then(
              //   (_) {
              //     if (!context.mounted) return;
              //      context.cubit<CreateVisitorInOutCubit>().handled();
              //        final inOutFilters =
              //     context.read<VisitorInOutFilterCubit>().state;
              //     context
              //         .cubit<VisitorInOutListCubit>()
              //         .fetchInitial(Pair((StringUtils.docStatusInt(inOutFilters.status)), inOutFilters.query));
              //   },
              // );
            }
            
            if (state.error.isNotNull) {
              await AppDialog.showErrorDialog(
                context,
                title: state.error!.error,
                content: state.error!.error,
                onTapDismiss: context.exit,
              );
              if(!context.mounted) return;
              context.cubit<CreateVisitorInOutCubit>().handled();
            }
          },
          child:  VisitorInOutFormWidget(key: ValueKey(status),),
        ),
      ),
      
    );
  }
}
