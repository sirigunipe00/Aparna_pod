import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';

abstract interface class IncidentRegistersRepo {
  AsyncValueOf<List<IncidentRegisterForm>> fetchIncidentRegister(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<List<String>> companyName();
  AsyncValueOf<List<String>> incidentType();

  AsyncValueOf<Pair<String, String>> createIncentRegister(IncidentRegisterForm form);
  AsyncValueOf<String> submitIncidentRegister(String id);
}
