import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/data/create_visit_repo.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:aparna_pod/features/invite_visitor/model/invite_visitor_form.dart';

import 'package:injectable/injectable.dart';

typedef CreateVisitListCubit = InfiniteListCubit<CreateVisitForm,
    Pair<String?, String?>, Pair<String?, String?>>;
typedef CreateVisitListCubitState = InfiniteListState<InviteVisitorForm>;

// typedef ApproveCubit = NetworkRequestCubit<None, Pair<String, String>>;
// typedef ApproveCubitState = NetworkRequestState<None>;

// typedef RejectCubit = NetworkRequestCubit<None, Pair<String, String>>;
// typedef RejectCubitState = NetworkRequestState<None>;

typedef PermissionCubit = NetworkRequestCubit<bool, String>;
typedef PermissionCubitState = NetworkRequestState<bool>;

@lazySingleton
class CreateVisitBlocProvider {
  const CreateVisitBlocProvider(this.repo);

  final CreateVisitRepo repo;

  static CreateVisitBlocProvider get() => $sl.get<CreateVisitBlocProvider>();

  CreateVisitListCubit createVisitList() => CreateVisitListCubit(
        requestInitial: (params, state) =>
            repo.fetchCreateVisitList(0, params!.first, params.second),
        requestMore: (params, state) => repo.fetchCreateVisitList(
            state.curLength, params!.first, params.second),
      );
  // ApproveCubit approveVisit() => ApproveCubit(
  //   onRequest: (params, state) => repo.approveButton(params!.first,params.second),
  // ); 
  // RejectCubit rejectVisit() => RejectCubit(
  //   onRequest: (params, state) => repo.rejectButton(params!.first,params.second),
  // );
   PermissionCubit visitPermission() => PermissionCubit(
    onRequest: (params, _) => repo.userPermission(params!),
  );
}
