import 'package:aparna_pod/app/presentation/app_home_page.dart';
import 'package:aparna_pod/app/presentation/app_profile_page.dart';
import 'package:aparna_pod/app/presentation/app_splash_scrn.dart';
import 'package:aparna_pod/app/widgets/app_scaffold_widget.dart';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/auth/presentation/authentication_scrn.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:aparna_pod/features/gate_entry/presentation/ui/widgets/gate_entry_list.dart';
import 'package:aparna_pod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/app_update_blocprovider.dart';

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
                builder: (_, state) => 
                 BlocProvider(
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

                          final gateEntryForm = state.extra as PodUploadForm?;
                          return MultiBlocProvider(
                            providers: [
                           
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
