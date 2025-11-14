import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/data/empty_vehicle_repo.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef EmptyVehicleListCubit = InfiniteListCubit<EmptyVehicleForm,
    Pair<int?, String?>, Pair<int?, String?>>;
typedef EmptyVehicleListCubitState = InfiniteListState<IncidentRegisterForm>;

typedef SupplierNameList = NetworkRequestCubit<List<SupplierNameForm>, None>;
typedef SupplierNameListState = NetworkRequestState<List<SupplierNameForm>>;

@lazySingleton
class EmptyVehicleBlocProvider {
  const EmptyVehicleBlocProvider(this.repo);

  final EmptyVehicleRepo repo;

  static EmptyVehicleBlocProvider get() => $sl.get<EmptyVehicleBlocProvider>();

  EmptyVehicleListCubit fetchVehicleList() => EmptyVehicleListCubit(
        requestInitial: (params, state) =>
            repo.fetchEmptyVehicleList(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchEmptyVehicleList(
            state.curLength, params!.first, params.second),
      );

  SupplierNameList supplierNameList() =>
      SupplierNameList(onRequest: (_, state) => repo.supplierName());
}
