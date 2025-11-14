import 'package:aparna_pod/core/model/page_view_filters.dart';
import 'package:aparna_pod/core/model/page_view_filters_cubit.dart';
import 'package:aparna_pod/core/utils/utils.dart';

class VisitorInOutFilterCubit extends PageViewFiltersCubit {
  VisitorInOutFilterCubit() : super(PageViewFilters.initial());

  @override
  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  @override
  void onSearch([String? query]) {
    if(query.doesNotHaveValue) {
      emitSafeState(PageViewFilters(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}