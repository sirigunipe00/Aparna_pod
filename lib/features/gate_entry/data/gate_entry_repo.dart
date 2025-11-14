import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/customer_name_form.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_form.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:aparna_pod/features/gate_entry/model/material_name_form.dart';

abstract interface class GateEntryRepo {
  AsyncValueOf<List<GateEntryForm>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<List<GateEntryLinesForm>> fetchEntriesLines(
    String itemName,
  );

  AsyncValueOf<String> updateGateEntry(
    GateEntryForm forn,
    List<GateEntryLinesForm> lines,
  );

  AsyncValueOf<List<MaterialNameForm>> materialName();
  AsyncValueOf<List<SupplierNameForm>> supplierName();

  AsyncValueOf<Pair<String, String>> createGateEntry(
      GateEntryForm form, List<GateEntryLinesForm> lines);
  AsyncValueOf<Pair<String, String>> submitGateEntry(
      GateEntryForm form, List<GateEntryLinesForm> lines);
  AsyncValueOf<List<String>> fetchAttachments(
    String id,
  );
  //  AsyncValueOf<String> deleteLines(
  //   String id, List<String> lines
  // );

   
  
}
