import 'package:aparna_pod/core/model/pair.dart';
import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:dartz/dartz.dart';


abstract interface class CreateVisitRepo {
  AsyncValueOf<List<CreateVisitForm>> fetchCreateVisitList(
    int start,
    String? docStatus,
    String? search,);
  AsyncValueOf<Pair<String, String>> createVisit(CreateVisitForm form);
  AsyncValueOf<String> submitVisitor(String id);
  AsyncValueOf<None> approveButton(String id, String action);
  AsyncValueOf<None> rejectButton(String id, String action);
  AsyncValueOf<None> sendforApprovalButton(String id, String action);
  AsyncValueOf<bool> userPermission (String name);

  
}
