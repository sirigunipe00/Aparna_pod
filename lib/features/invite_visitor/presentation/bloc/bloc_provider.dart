import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/invite_visitor/data/invite_visitor_repo.dart';
import 'package:aparna_pod/features/invite_visitor/model/department_form.dart';
import 'package:aparna_pod/features/invite_visitor/model/invite_visitor_form.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef InviteVisitorListCubit = InfiniteListCubit<InviteVisitorForm,
    Pair<int?, String?>, Pair<int?, String?>>;
typedef InviteVisitorListCubitState = InfiniteListState<InviteVisitorForm>;

typedef DeaprtmentList = NetworkRequestCubit<List<DepartmentForm>, None>;
typedef DeaprtmentListState = NetworkRequestState<List<DepartmentForm>>;

typedef InviteVisitorCubit = NetworkRequestCubit<InviteVisitorForm?, String?>;
typedef InviteVisitorCubitState = NetworkRequestState<InviteVisitorForm?>;



@lazySingleton
class InviteVisitorBlocProvider {
  const InviteVisitorBlocProvider(this.repo);

  final InviteVisitorRepo repo;

  static InviteVisitorBlocProvider get() =>
      $sl.get<InviteVisitorBlocProvider>();

  InviteVisitorListCubit inviteVisitorList() => InviteVisitorListCubit(
        requestInitial: (params, state) =>
            repo.fetchVisitorList(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchVisitorList(
            state.curLength, params!.first, params.second),
      );

  DeaprtmentList departmentList() => DeaprtmentList(
        onRequest: (_, state) => repo.departmentName(),
      );

    InviteVisitorCubit  inviteVisitorss() => InviteVisitorCubit(
    onRequest: (param, state) => repo.fetchVisitorss(param)
    ,);
}
