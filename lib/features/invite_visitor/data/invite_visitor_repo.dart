import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:aparna_pod/features/invite_visitor/model/department_form.dart';
import 'package:aparna_pod/features/invite_visitor/model/invite_visitor_form.dart';


abstract interface class InviteVisitorRepo {
  AsyncValueOf<List<InviteVisitorForm>> fetchVisitorList(
    int start,
    int? docStatus,
    String? search,);
  AsyncValueOf<String> createInviteVisitor(InviteVisitorForm form);
  AsyncValueOf<String> submitInviteVisitor(String id);
  AsyncValueOf<List<DepartmentForm>> departmentName();
    AsyncValueOf<InviteVisitorForm?> fetchVisitorss(
    String? search,);


  
}
