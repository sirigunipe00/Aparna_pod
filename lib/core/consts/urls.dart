import 'package:aparna_pod/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  factory Urls.aparnaUAT() =>
      const Urls('http://192.168.3.64/api');
      factory Urls.local() => const Urls('http://192.168.0.134:8000/api');
  factory Urls.aparnaLive() => const Urls('https://aparnagmlive.easycloud.co.in/api');

  const Urls(this.url);

  final String url;

  static bool get isTest => Uri.parse(_reqisteredUrl.url)
      .authority
      .split('.')
      .first
      .toLowerCase()
      .contains('uat');

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';
  static final uploadFiles = '$cusWs/aparna_pod.api.upload_files';

  static final appUpdate ='$cusWs/easy_common.api.get_app_version';

  static final login = '$cusWs/login';
  static final getUsers = '$cusWs/aparna_pod.auth.user_login.custom_login';
  static final podUpload = '$cusWs/aparna_pod.api.pod_invoice.upload_pod_invoice';
  static final getList = '$cusWs/frappe.client.get_list';
  static final getOutwardList = '$cusWs/frappe.client';
  static final createGateEntry = '$cusWs/aparna_pod.api.create_gate_entry';
  static final submitGateEntry = '$cusWs/aparna_pod.api.submit_gate_entry';
  static final createInviteVisitor = '$cusWs/aparna_pod.api.create_invite_visitor';
  static final submitInviteVisitor = '$cusWs/aparna_pod.api.submit_invite_visitor';
  static final updateGateEntry = '$cusWs/aparna_pod.api.update_gate_entry';
  static final updateGateExit = '$cusWs/aparna_pod.api.update_gate_exit';
  static final deleteLines = '$cusWs/aparna_pod.api.remove_lines';

  static final createGateExit = '$cusWs/aparna_pod.api.create_gate_exit';
  static final submitGateExit = '$cusWs/aparna_pod.api.submit_gate_Exit';
  static final receiverAddress = '$cusWs/aparna_pod.api.get_address';
  static final supplierName = '$jsonWs/Supplier';
  static final customerName = '$jsonWs/Customer';
  static final companyName = '$jsonWs/Company';
  static final department = '$jsonWs/Department';
  static final incidentType = '$jsonWs/Incident Type';
  static final defaultGateEntry = '$jsonWs/Gate Entry';
  static final defaultGateExit = '$jsonWs/Gate Exit';
  static final defaultOutward = '$jsonWs/Outward Gate Pass RGP';
  static final defaultInward = '$jsonWs/Inward Gate Pass RGP';
  static final item = '$jsonWs/Item';
  static final uomList ='$jsonWs/UOM';
  static final outwardlist = '$cusWs/aparna_pod.api.get_outwards_for_inward';

  static final createIncidentRegister = '$cusWs/aparna_pod.api.create_incident_register';
  static final submitIncidentRegister = '$cusWs/aparna_pod.api.submit_incident_register';
  
  static final createVisitorInOut = '$cusWs/aparna_pod.api.create_in_out';
  static final submitVisitorInOut = '$cusWs/aparna_pod.api.submit_in_out';
  
  static final getVisitors = '$cusWs/aparna_pod.api.get_visitors';
  static final createVisit = '$cusWs/aparna_pod.api.create_visit';
  static final submitVisit= '$cusWs/aparna_pod.api.submit_create_visit';
  static final approvalWorkFlow = '$cusWs/frappe.model.workflow.apply_workflow';
  static final userPermission = '$cusWs/aparna_pod.api.check_user_permission_for_visit_approval';

  static final createOutward = '$cusWs/aparna_pod.api.create_outward_gatepass';
   static final updateOutward = '$cusWs/aparna_pod.api.update_outward_gatepass';
  static final submitOutward = '$cusWs/aparna_pod.api.submit_outward_gatepass';

  static final createInward = '$cusWs/aparna_pod.api.create_inward_gatepass';
  static final updateInward = '$cusWs/aparna_pod.api.update_inward_gatepass';
  static final submitInward = '$cusWs/aparna_pod.api.submit_inward_gatepass';

  static final createEmptyVehicle = '$cusWs/aparna_pod.api.create_empty_vehicle_tracking';
  static final updateEmptyVehicle = '$cusWs/aparna_pod.api.update_empty_vehicle_tracking';
  static final submitEmptyVehicle = '$cusWs/aparna_pod.api.submit_empty_vehicle_tracking';

  static final removelines ='$cusWs/aparna_pod.api.remove_outward_or_inward_items';




  static filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }
}
