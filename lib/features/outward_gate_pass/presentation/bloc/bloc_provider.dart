import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/outward_gate_pass/data/outward_repo.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/uom_list_form.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef OutwardListCubit = InfiniteListCubit<OutwardForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef OutwardListCubitState = InfiniteListState<OutwardForm>;

typedef OutwardLinesCubit = NetworkRequestCubit<List<ItemsForm>, String>;
typedef OutwardLinesCubitState = NetworkRequestState<List<ItemsForm>>;

typedef UomListCubit = NetworkRequestCubit<List<UomListForm>, None>;
typedef UomListCubitState = NetworkRequestState<List<UomListForm>>;

@lazySingleton
class OutwardBlocProvider {
  const OutwardBlocProvider(this.repo);

  final OutwardRepo repo;

  static OutwardBlocProvider get() => $sl.get<OutwardBlocProvider>();

  OutwardListCubit outwardGatePassList() => OutwardListCubit(
        requestInitial: (params, state) =>
            repo.fetchOutwards(0, params!.first, params.second),
        requestMore: (params, state) =>
            repo.fetchOutwards(state.curLength, params!.first, params.second),
      );
 
  OutwardLinesCubit fetchOutwardItemLines() => OutwardLinesCubit(
        onRequest: (params, state) => repo.fetchOutwardLines(params!),
      );
  UomListCubit uomdataList() => UomListCubit(onRequest: (_, state) => repo.uomList());
 
}
