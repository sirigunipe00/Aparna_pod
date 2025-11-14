import 'package:aparna_pod/app/widgets/app_page_view2.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/core/model/page_view_filters.dart';
import 'package:aparna_pod/features/inward_gate_pass/model/inward_form.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/inWard_filter_cubit.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/widgets/inward_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:aparna_pod/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InWardDetailsScrn extends StatelessWidget {
  const InWardDetailsScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<InwardFilterCubit>(
      mode: PageMode2.inWardGatePass,
      onNew: () => AppRoute.newInWardGatePass.push(context),
      backgroundColor: AppColors.marigoldDDust,
      scaffoldBg: AppIcons.bgFrame1.path,
      child: BlocListener<InwardFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<InwardListCubit, InwardForm>(
          childBuilder: (context,  inWard) => InwardWidget(
            inWard: inWard,
            onTap: () => AppRoute.newInWardGatePass.push<bool?>(context, extra: inWard),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Inward Gate Passes Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<InwardFilterCubit>().state;
    context.cubit<InwardListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<InwardFilterCubit>().state;
    context
        .cubit<InwardListCubit>()
        .fetchMore(Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }
}
