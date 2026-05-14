import 'package:aparna_pod/core/core.dart';

import 'package:aparna_pod/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:aparna_pod/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';

import 'package:aparna_pod/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aparna_pod/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';

import 'package:aparna_pod/styles/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AparnaApp extends StatelessWidget {
  const AparnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => $sl.get<AuthCubit>()..authCheckRequested(),
        ),
        BlocProvider(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(
            create: (_) => GateEntryBlocProvider.get().fetchGateEntries()),
        
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (_, state) {
          final routerCtxt = AppRouterConfig.parentNavigatorKey.currentContext;
          state.maybeWhen(
            orElse: () => AppRoute.initial.go(routerCtxt!),
            authenticated: () {
              final filters = Pair(StringUtils.docStatusInt('Draft'), null);
              routerCtxt!
                .cubit<GateEntriesCubit>().fetchInitial(filters);
                AppRoute.home.go(routerCtxt);
            },
            unAuthenticated: () => AppRoute.login.go(routerCtxt!),
          );
        },
        builder: (_, state) {
          return MaterialApp.router(
            title: 'Aparna',
            theme: AppMaterialTheme.lightTheme,
            darkTheme: AppMaterialTheme.lightTheme,
            routerConfig: AppRouterConfig.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
