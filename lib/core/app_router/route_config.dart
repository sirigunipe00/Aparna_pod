import 'package:aparna_pod/app/presentation/app_home_page.dart';
import 'package:aparna_pod/app/presentation/app_profile_page.dart';
import 'package:aparna_pod/app/presentation/app_splash_scrn.dart';
import 'package:aparna_pod/app/presentation/app_update_blocprovider.dart';
import 'package:aparna_pod/app/widgets/app_scaffold_widget.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/bloc/cubit/create_visit_cubit.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/ui/create/new_create_visit_widget.dart';
import 'package:aparna_pod/features/Create%20Visit/presentation/ui/widgets/create_visit_list.dart';
import 'package:aparna_pod/features/auth/presentation/authentication_scrn.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_cubit/create_empty_vehicle_cubit.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/ui/create/new_empty_vehicle_tracking.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/presentation/ui/widgets/empty_vehicle_list.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/widgets/gate_entry_list.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_exit/presentation/bloc/cubit/create_gate_exit_cubit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/ui/create/new_gate_exit.dart';
import 'package:aparna_pod/features/gate_exit/presentation/ui/widgets/gate_exit_list.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/incident_register/presentation/bloc/create_incident_register/incident_register_cubit.dart';
import 'package:aparna_pod/features/incident_register/presentation/ui/create/new_incident_register.dart';
import 'package:aparna_pod/features/incident_register/presentation/ui/widgets/incident_register_list.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/bloc/cubit/create_invite_visitor_cubit.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/ui/create/new_invite_visitor.dart';
import 'package:aparna_pod/features/invite_visitor/presentation/ui/widgets/invite_visitor_list.dart';
import 'package:aparna_pod/features/inward_gate_pass/model/inward_form.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/bloc/cubit/create_inward_cubit.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/create/create_new_inward.dart';
import 'package:aparna_pod/features/inward_gate_pass/presentation/widgets/inward_details_list.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/bloc/cubit/create_outward_cubit.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/ui/create/new_outward_.dart';
import 'package:aparna_pod/features/outward_gate_pass/presentation/ui/widgets/outward_list.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/bloc/cubit/create_visitor_in_out_cubit.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/ui/create/new_visitor_in_out.dart';
import 'package:aparna_pod/features/visitor_in_out/presentation/ui/widgets/visitor_in_out_list.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.initial.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.initial.path,
        builder: (_, state) => const AppSplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder: (_, state) => BlocProvider(
                  create: (_) =>
                            AppUpdateBlocprovider.get().appversionCubit()..request(),
                  child: const AppHomePage(),
                ),
                routes: [
                  GoRoute(
                    path: _getPath(AppRoute.gateEntry),
                    builder: (ctxt, state) => const GateEntryListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateEntry),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final gateEntryForm = state.extra as GateEntryForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.companyNameList()..request()),
                              BlocProvider(
                                  create: (_) => GateExitBlocProvider.get()
                                      .receiverAddressList()),
                              BlocProvider(
                                  create: (_) => GateEntryBlocProvider.get()
                                      .supplierNameList()
                                    ..request()),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateEntryBlocProvider.get()
                                      .fetchGateEntryLines();
                                  if (gateEntryForm != null) {
                                    bloc.request(gateEntryForm.name);
                                  }
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateEntryBlocProvider.get()
                                      .attachmentsList();
                                  if (gateEntryForm != null) {
                                    bloc.request(gateEntryForm.name);
                                  }
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                  create: (_) => GateExitBlocProvider.get()
                                      .receiverNameList()
                                    ..request()),
                              BlocProvider(
                                  create: (_) => $sl.get<CreateGateEntryCubit>()
                                    ..initDetails(gateEntryForm)),
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.gateExit),
                    builder: (ctxt, state) => const GateExitListScrn(),
                    routes: [
                      GoRoute(
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        path: _getPath(AppRoute.newGateExit),
                        builder: (_, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final blocprovider = GateExitBlocProvider.get();
                          final form = state.extra as GateExitForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.companyNameList()..request()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.receiverAddressList()),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateExitBlocProvider.get()
                                      .fetchGateExitLines();
                                  if (form != null) bloc.request(form.name);
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateEntryBlocProvider.get()
                                      .attachmentsList();
                                  if (form != null) bloc.request(form.name);
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                  create: (_) => blocprovider.receiverNameList()
                                    ..request()),
                              BlocProvider(
                                  create: (_) => $sl.get<CreateGateExitCubit>()
                                    ..init(form)),
                            ],
                            child: const NewGateExit(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.incidentRegister),
                    builder: (_, state) => const IncidentRegisterListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newIncidentReg),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final incRegForm =
                              state.extra as IncidentRegisterForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.incidentTypeList()..request()),
                              BlocProvider(
                                  create: (_) =>
                                      provider.companyNameList()..request()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateIncidentRegisterCubit>()
                                      ..initDetails(incRegForm),
                              ),
                            ],
                            child: const NewIncidentRegister(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.inviteVisitor),
                    builder: (ctxt, state) => const InviteVisitorListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newInviteVisitor),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = InviteVisitorBlocProvider.get();
                          final form = state.extra;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    IncidentRegisterBlocProvider.get()
                                        .companyNameList()
                                      ..request(),
                              ),
                              BlocProvider(
                                  create: (_) => blocprovider.inviteVisitorss()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.departmentList()..request()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateInviteVisitorCubit>()
                                      ..init(form),
                              ),
                            ],
                            child: const NewInviteVisitor(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.createVisit),
                    builder: (ctxt, state) => const CreateVisitListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newCreateVisit),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = InviteVisitorBlocProvider.get();
                          // final blocprovider2 = CreateVisitBlocProvider.get();

                          final form = state.extra as CreateVisitForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) => blocprovider.inviteVisitorss()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.departmentList()..request()),
                                      BlocProvider(
                                create: (context) =>
                                    IncidentRegisterBlocProvider.get()
                                        .companyNameList()
                                      ..request(),
                              ),
                              // BlocProvider(
                              //     create: (_) => blocprovider2.rejectVisit()),
                              // BlocProvider(
                              //     create: (_) => blocprovider2.approveVisit()),
                              // BlocProvider(
                              //     create: (_) => blocprovider2.visitPermission()
                              //       ..request(form!.name)),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateVisitCubit>()..init(form),
                              ),
                            ],
                            child: const NewCreateVisit(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.visitorInOut),
                    builder: (ctxt, state) => const VisitorInOutListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newVisitorInOut),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = VisitorInOutBlocProvider.get();
                          final form = state.extra;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) => blocprovider.visitorsFetching()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateVisitorInOutCubit>()
                                      ..init(form),
                              ),
                            ],
                            child: const NewVisitorInOut(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.outWardGatePass),
                    builder: (ctxtt, state) => const OutwardListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newOutWardGatePass),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (ctxt, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final form = state.extra as OutwardForm?;
                          return MultiBlocProvider(providers: [
                            BlocProvider(
                                create: (_) => GateEntryBlocProvider.get()
                                    .supplierNameList()
                                  ..request()),
                            BlocProvider(
                                create: (_) =>
                                    OutwardBlocProvider.get().uomdataList()
                                      ..request()),
                            BlocProvider(
                              create: (_) {
                                final bloc = OutwardBlocProvider.get()
                                    .fetchOutwardItemLines();
                                if (form != null) bloc.request(form.name);
                                return bloc;
                              },
                            ),
                            BlocProvider(
                                create: (_) => GateExitBlocProvider.get()
                                    .receiverNameList()
                                  ..request()),
                            BlocProvider(
                              create: (_) =>
                                  provider.companyNameList()..request(),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  $sl.get<CreateOutwardCubit>()..init(form),
                            ),
                          ], child: const NewOutWardGatePass());
                        },
                      )
                    ],
                  ),
                  GoRoute(
                      path: _getPath(AppRoute.inWardGatePass),
                      builder: (ctxtt, state) => const InWardDetailsScrn(),
                      routes: [
                        GoRoute(
                          path: _getPath(AppRoute.newInWardGatePass),
                          onExit: (context, state) async =>
                              await _promptConf(context),
                          builder: (ctxt, state) {
                            final provider = IncidentRegisterBlocProvider.get();
                            final provider1 = InwardBlocProvider.get();
                            final form = state.extra as InwardForm?;
                            return MultiBlocProvider(providers: [
                              BlocProvider(
                                  create: (_) => GateEntryBlocProvider.get()
                                      .supplierNameList()
                                    ..request()),
                              BlocProvider(
                                  create: (_) => GateExitBlocProvider.get()
                                      .receiverNameList()
                                    ..request()),
                              BlocProvider(
                                create: (_) =>
                                    provider.companyNameList()..request(),
                              ),
                              BlocProvider(
                                create: (_) {
                                  final bloc = provider1.fetchInwardItemLines();
                                  if (form != null) bloc.request(form.name);
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                create: (_) =>
                                    provider1.outwardGatePassList()..request(),
                              ),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateInwardCubit>()..init(form),
                              ),
                            ], child: const CreateNewInWardGatePass());
                          },
                        ),
                      ]),
                  GoRoute(
                      path: _getPath(AppRoute.emptyVehicle),
                      builder: (context, state) => const EmptyVehicleList(),
                      routes: [
                        GoRoute(
                          path: _getPath(AppRoute.newEmptyVehicle),
                          builder: (context, state) {
                            final provider = IncidentRegisterBlocProvider.get();
                            final form = state.extra as EmptyVehicleForm?;

                            return MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      provider.companyNameList()..request(),
                                ),
                                BlocProvider(
                                    create: (_) =>
                                        EmptyVehicleBlocProvider.get()
                                            .supplierNameList()
                                          ..request()),
                                BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateEmptyVehicleCubit>()
                                        ..initDetails(form),
                                ),
                              ],
                              child: const NewEmptyVehicleTracking(),
                            );
                          },
                        )
                      ])
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.account.path,
                builder: (_, __) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static Future<bool> _promptConf(BuildContext context) async {
    final promptConf = shouldAskForConfirmation.value;
    if (!promptConf) return true;
    return await AppDialog.askForConfirmation<bool?>(
          context,
          title: 'Are you sure',
          confirmBtnText: 'Yes',
          content: Messages.clearConfirmation,
          onTapConfirm: () => context.exit(true),
          onTapDismiss: () => context.exit(false),
        ) ??
        false;
  }

  static String _getPath(AppRoute route) => route.path.split('/').last;
}
