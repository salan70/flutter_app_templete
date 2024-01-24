import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'core/repository/package_info/package_info_repository.dart';
import 'util/flavor.dart';
import 'util/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final PackageInfo packageInfo;

  await (
    /// Firebase.
    Firebase.initializeApp(),

    /// 縦固定
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),

    Future(() async {
      packageInfo = await PackageInfo.fromPlatform();
    }),
  ).wait;

  logger.i(Flavor.environment);

  /// Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    ProviderScope(
      overrides: [
        packageInfoRepositoryProvider
            .overrideWithValue(PackageInfoRepository(packageInfo)),
      ],
      child: const App(),
    ),
  );
}
