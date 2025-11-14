import 'package:aparna_pod/app/widgets/app_page_view2.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/core/model/page_view_filters.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/gate_exit_filter_cubit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/ui/widgets/gate_exit_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:aparna_pod/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GateExitListScrn extends StatelessWidget {
  const GateExitListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<GateExitFilterCubit>(
      mode: PageMode2.gateexit,
      onNew: () => AppRoute.newGateExit.push(context),
      backgroundColor: AppColors.shyMoment,
      scaffoldBg: AppIcons.bgFrame2.path,
      child: BlocListener<GateExitFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<GateExitListCubit, GateExitForm>(
          childBuilder: (context, exit) => GateExitWidget(
            gateExit: exit,
            onTap: () => AppRoute.newGateExit.push<bool?>(context, extra: exit),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No GateExits Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context
        .cubit<GateExitListCubit>()
        .fetchMore(Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }
}
