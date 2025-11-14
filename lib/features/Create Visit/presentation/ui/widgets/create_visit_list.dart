import 'package:aparna_pod/app/widgets/app_page_view2.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/core/model/page_view_filters.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/create_visit_filter_cubit.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/ui/widgets/create_visit_widget.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:aparna_pod/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateVisitListScrn extends StatelessWidget {
  const CreateVisitListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<CreateVisitFilterCubit>(
      mode: PageMode2.createVisit,
      onNew: () => AppRoute.newCreateVisit.push(context),
      backgroundColor: AppColors.invite,
      scaffoldBg: AppIcons.bgFrame4.path,
      child: BlocListener<CreateVisitFilterCubit, PageViewFilters>(
        listener: (context, state) => _fetchInitial(context),
        child:
            InfiniteListViewWidget<CreateVisitListCubit, CreateVisitForm>(
          childBuilder: (context, visitor) => CreateVisitWidget(
            visit: visitor,
            onTap: () =>
                AppRoute.newCreateVisit.push<bool?>(context, extra: visitor),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Visits Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<CreateVisitFilterCubit>().state;
    context.cubit<CreateVisitListCubit>().fetchInitial(
        Pair(filter.status, filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<CreateVisitFilterCubit>().state;
    context
        .cubit<CreateVisitListCubit>()
        .fetchMore(Pair((filter.status), filter.query));
  }
}
