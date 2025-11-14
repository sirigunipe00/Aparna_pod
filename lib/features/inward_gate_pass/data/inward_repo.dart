import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:aparna_pod/features/inward_gate_pass/model/inward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';

abstract interface class InwardRepo {
  AsyncValueOf<List<InwardForm>> fetchInwards(
    int start,
    int? docStatus,
    String? search,
  );
  AsyncValueOf<List<OutwardForm>> fetchOutwards();
   AsyncValueOf<String> createInwardGatePass(InwardForm form,List<ItemsForm> lines);
  AsyncValueOf<String> submitInwardGatePass(InwardForm form, List<ItemsForm> lines);
  AsyncValueOf<List<ItemsForm>> fetchInwardLines(String itemName,);
  AsyncValueOf<String> updateInward(InwardForm form,List<ItemsForm> lines,);


}
