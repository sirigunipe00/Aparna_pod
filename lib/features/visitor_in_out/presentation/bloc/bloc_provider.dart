import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/visitor_in_out/data/visitor_in_out_repo.dart';
import 'package:aparna_pod/features/visitor_in_out/model/visitor_in_out_form.dart';

import 'package:injectable/injectable.dart';

typedef VisitorInOutListCubit = InfiniteListCubit<VisitorInOutForm,
    Pair<int?, String?>, Pair<int?, String?>>;
typedef VisitorInOutListCubitState = InfiniteListState<VisitorInOutForm>;

typedef FetchVisitorsCubit = NetworkRequestCubit<VisitorInOutForm, String?>;
typedef FetchVisitorsCubitState = NetworkRequestState<VisitorInOutForm>;

@lazySingleton
class VisitorInOutBlocProvider {
  const VisitorInOutBlocProvider(this.repo);

  final VisitorInOutRepo repo;

  static VisitorInOutBlocProvider get() => $sl.get<VisitorInOutBlocProvider>();

  VisitorInOutListCubit visitorInOutList() => VisitorInOutListCubit(
        requestInitial: (params, state) =>
            repo.fetchVisitorInOutList(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchVisitorInOutList(
            state.curLength, params!.first, params.second),
      );
  FetchVisitorsCubit  visitorsFetching() => FetchVisitorsCubit(
    onRequest: (param, state) => repo.fetchVisitor(param)
    ,);
}
