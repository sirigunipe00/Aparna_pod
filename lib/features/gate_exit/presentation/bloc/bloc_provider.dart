import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:aparna_pod/features/gate_exit/data/gate_exit_repo.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_address_form.dart';
import 'package:aparna_pod/features/gate_exit/model/receiver_name_form.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef GateExitListCubit
    = InfiniteListCubit<GateExitForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef GateExitListCubitState = InfiniteListState<GateExitForm>;

typedef ReceiverAddressList
    = NetworkRequestCubit<List<ReceiverAddressForm>, String>;
typedef ReceiverAddressListState
    = NetworkRequestState<List<ReceiverAddressForm>>;

typedef GateExitLinesCubit
    = NetworkRequestCubit<List<GateEntryLinesForm>, String>;
typedef GateExitLinesCubitState
    = NetworkRequestState<List<GateEntryLinesForm>>;

typedef ReceiverNameList = NetworkRequestCubit<List<ReceiverNameForm>, None>;
typedef ReceiverNameListState = NetworkRequestState<List<ReceiverNameForm>>;

@lazySingleton
class GateExitBlocProvider {
  const GateExitBlocProvider(this.repo);

  final GateExitRepo repo;

  static GateExitBlocProvider get() => $sl.get<GateExitBlocProvider>();

  GateExitListCubit gateExitList() => GateExitListCubit(
        requestInitial: (params, state) => repo.fetchExits(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchExits(state.curLength, params!.first, params.second),
      );
  ReceiverAddressList receiverAddressList() => ReceiverAddressList(
        onRequest: (params, state) => repo.receiverAddress(params!),);
  GateExitLinesCubit fetchGateExitLines() => GateExitLinesCubit(onRequest: (params, state) => repo.fetchExitLines(params!),);
  ReceiverNameList receiverNameList() => ReceiverNameList(onRequest: (_, state) => repo.receiverName(),);
}
