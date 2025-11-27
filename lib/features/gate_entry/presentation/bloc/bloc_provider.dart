import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/data/gate_entry_repo.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';


import 'package:injectable/injectable.dart';

typedef GateEntriesCubit = InfiniteListCubit<PodUploadForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef GateEntriesCubitState = InfiniteListState<PodUploadForm>;

// typedef GateEntryLinesCubit = NetworkRequestCubit<List<GateEntryLinesForm>, String>;
// typedef GateEntryLinesCubitState = NetworkRequestState<List<GateEntryLinesForm>>;

// typedef MaterialNameList = NetworkRequestCubit<List<MaterialNameForm>, None>;
// typedef MaterialNameListState = NetworkRequestState<List<MaterialNameForm>>;

// typedef SupplierNameList = NetworkRequestCubit<List<SupplierNameForm>, None>;
// typedef SupplierNameListState = NetworkRequestState<List<SupplierNameForm>>;

typedef AttachmentsList = NetworkRequestCubit<List<String>, String>;
typedef AttachmentsListState = NetworkRequestState<List<String>>;


// typedef DeleteLines = NetworkRequestCubit<String, Pair<String ,List<String>>>;
// typedef DeleteLinesState = NetworkRequestState<String>;

@lazySingleton
class GateEntryBlocProvider {
  const GateEntryBlocProvider(this.repo);

  final GateEntryRepo repo;

  static GateEntryBlocProvider get() => $sl.get<GateEntryBlocProvider>();

  GateEntriesCubit fetchGateEntries() => GateEntriesCubit(
    requestInitial: (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore: (params, state) => repo.fetchEntries(state.curLength, params!.first, params.second),
  );

  // GateEntryLinesCubit fetchGateEntryLines() => GateEntryLinesCubit(
  //   onRequest: (params, state) => repo.fetchEntriesLines(params!),
  // );

  // MaterialNameList materialNameList() => MaterialNameList(onRequest: (_, state) => repo.materialName());

  // SupplierNameList supplierNameList() => SupplierNameList(onRequest: (_, state) => repo.supplierName());

  // AttachmentsList attachmentsList() => AttachmentsList(
  //   onRequest:(params, state) => repo.fetchAttachments(params!), );

    // DeleteLines removeGaylord() => DeleteLines(
    // onRequest:(params, state) =>repo.deleteLines(params!.first, params.second));


}
