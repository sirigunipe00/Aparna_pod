import 'package:aparna_pod/app/widgets/app_page_view2.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/core/model/page_view_filters.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/incident_register_filter_cubit.dart';
import 'package:aparna_pod/features/incident_register/presentation/ui/widgets/incident_register_widget.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:aparna_pod/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentRegisterListScrn extends StatelessWidget {
  const IncidentRegisterListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<IncidentRegisterFilterCubit>(
      mode: PageMode2.incidentregister,
      scaffoldBg: AppIcons.bgFrame3.path,
      backgroundColor: const Color(0xFF808080),
      onNew: () => AppRoute.newIncidentReg.push(context),
      child: BlocListener<IncidentRegisterFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<IncidentRegistersListCubit,
            IncidentRegisterForm>(
          childBuilder: (context, entry) => IncidentRegisterWidget(
            registerForm: entry,
            onTap: () =>
                AppRoute.newIncidentReg.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Incident Registrations Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filters = context.read<IncidentRegisterFilterCubit>().state;
    context.cubit<IncidentRegistersListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void _fetchMore(BuildContext context) {
    final filters = context.read<IncidentRegisterFilterCubit>().state;
    context.cubit<IncidentRegistersListCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
