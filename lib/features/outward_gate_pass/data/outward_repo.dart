import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/uom_list_form.dart';


abstract interface class OutwardRepo {
  AsyncValueOf<List<OutwardForm>> fetchOutwards(
    int start,
    int? docStatus,
    String? search,);
  AsyncValueOf<String> createOutwardGatePass(OutwardForm form,List<ItemsForm> lines);
  AsyncValueOf<String> submitOutwardGatePass(OutwardForm form, List<ItemsForm> lines);
  AsyncValueOf<List<ItemsForm>> fetchOutwardLines(String itemName);
  AsyncValueOf<String> updateOutward(OutwardForm form,List<ItemsForm> lines,);
  AsyncValueOf<List<UomListForm>> uomList();

}
