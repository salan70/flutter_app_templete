import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_html/html.dart';
import 'package:universal_html/js.dart';

import 'app.dart';
import 'core/infrastructure/repository/package_info/package_info_repository.dart';
import 'feature/flavor/flavor.dart';
import 'util/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.fromEnvironment;

  /// 画面を縦方向に固定する。
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final packageInfo = await PackageInfo.fromPlatform();

  if (kIsWeb) {
    context['flavor'] = const String.fromEnvironment('flavor');
    document.dispatchEvent(CustomEvent('dart_loaded'));
  }

  logger.i(flavor);

  // * -- Firebase 関連の初期化処理 -- * //
  await Firebase.initializeApp(options: flavor.firebaseOptions);

  // Analytics.
  await FirebaseAnalytics.instance.logEvent(name: 'launch_app');

  // Crashlytics.
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
        flavorProvider.overrideWithValue(flavor),
      ],
      child: DevicePreview(
        // Web かつ release モードでない場合のみ有効にする。
        enabled: kIsWeb && !kReleaseMode,
        builder: (context) => const App(),
      ),
    ),
  );
}
