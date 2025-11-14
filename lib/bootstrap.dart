// import 'dart:async';
// import 'dart:isolate';

// import 'package:aparna_pod/core/consts/urls.dart';
// import 'package:aparna_pod/core/di/injector.dart';
// import 'package:aparna_pod/core/logger/app_logger.dart';
// // import 'package:aparna_pod/firebase_options.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:injectable/injectable.dart';


// Future<void> bootstrap(void Function() runApp) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   await _initInjector();
//   if(kDebugMode) {
//     await register<Urls>(Urls.local(), instanceName: 'baseUrl');
//   } else {
//     await register<Urls>(Urls.local(), instanceName: 'baseUrl');
//   }
//   // await _initFirebase();
//   _setupErrorHandling(runApp);
// }

// Future<void> _initInjector() async {
//   await configureDependencies(env: Environment.prod);
// }

// // Future<void> _initFirebase() async {
// //   await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
// //   if (kDebugMode) {
// //     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
// //   }
// // }


// void _setupErrorHandling(void Function() runApp) {
//   Isolate.current.addErrorListener(
//     RawReceivePort((pair) async {
//       try {
//         final List<dynamic> errorAndStacktrace = pair as List<dynamic>;
//         // await FirebaseCrashlytics.instance.recordError(
//         //   errorAndStacktrace.first,
//         //   errorAndStacktrace.last as StackTrace,
//         // );
//       } on Exception catch (e, st) {
//         $logger.error('[Running isolate error]', e, st);
//       }
//     }).sendPort,
//   );

//   runZonedGuarded<Future<void>>(
//     () async {
//       FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//       runApp();
//     },
//     FirebaseCrashlytics.instance.recordError,
//   );
// }


import 'dart:async';
import 'dart:isolate';

import 'package:aparna_pod/core/consts/urls.dart';
import 'package:aparna_pod/core/di/injector.dart';
import 'package:aparna_pod/core/logger/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

Future<void> bootstrap(void Function() runApp) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await _initInjector();

  if (kDebugMode) {
    await register<Urls>(Urls.local(), instanceName: 'baseUrl');
  } else {
    await register<Urls>(Urls.local(), instanceName: 'baseUrl');
  }

  _setupErrorHandling(runApp);
}

Future<void> _initInjector() async {
  await configureDependencies(env: Environment.prod);
}

void _setupErrorHandling(void Function() runApp) {
  // Handle uncaught errors in isolates
  Isolate.current.addErrorListener(
    RawReceivePort((pair) async {
      try {
        final List<dynamic> errorAndStacktrace = pair as List<dynamic>;
        final error = errorAndStacktrace.first;
        final stackTrace = errorAndStacktrace.last as StackTrace;
        $logger.error('[Isolate error]', error, stackTrace);
      } catch (e, st) {
        $logger.error('[Error listener failed]', e, st);
      }
    }).sendPort,
  );

  // Handle Flutter & async errors
  runZonedGuarded<Future<void>>(
    () async {
      FlutterError.onError = (FlutterErrorDetails details) {
        // Log all Flutter framework errors
        $logger.error('[Flutter error]', details.exception, details.stack);
      };
      runApp();
    },
    (error, stackTrace) {
      // Catch all uncaught async errors
      $logger.error('[Uncaught error]', error, stackTrace);
    },
  );
}
