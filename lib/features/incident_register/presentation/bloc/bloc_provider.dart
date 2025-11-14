import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/data/incident_register_repo.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef IncidentRegistersListCubit = InfiniteListCubit<IncidentRegisterForm,
    Pair<int?, String?>, Pair<int?, String?>>;
typedef IncidentRegistersListCubitState
    = InfiniteListState<IncidentRegisterForm>;

mixin CompanyNameList on NetworkRequestCubit<List<String>, None> {}
mixin IncidentTypeList on NetworkRequestCubit<List<String>, None> {}

class StringListCubit extends NetworkRequestCubit<List<String>, None>
    with CompanyNameList, IncidentTypeList {
  StringListCubit({required super.onRequest});
}

@lazySingleton
class IncidentRegisterBlocProvider {
  const IncidentRegisterBlocProvider(this.repo);

  final IncidentRegistersRepo repo;

  static IncidentRegisterBlocProvider get() =>
      $sl.get<IncidentRegisterBlocProvider>();

  IncidentRegistersListCubit fetchRegistrations() => IncidentRegistersListCubit(
        requestInitial: (params, state) =>
            repo.fetchIncidentRegister(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchIncidentRegister(
            state.curLength, params!.first, params.second),
      );

  CompanyNameList companyNameList() => StringListCubit(
        onRequest: (_, state) => repo.companyName(),
      );

  IncidentTypeList incidentTypeList() => StringListCubit(
        onRequest: (_, state) => repo.incidentType(),
      );
}
