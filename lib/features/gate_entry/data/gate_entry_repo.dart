import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';

abstract interface class GateEntryRepo {
  AsyncValueOf<List<PodUploadForm>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<Pair<String, String>> createGateEntry(
      PodUploadForm form);
 

  //  AsyncValueOf<String> deleteLines(
  //   String id, List<String> lines
  // );

   
  
}
