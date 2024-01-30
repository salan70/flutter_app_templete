import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

import '../../../core/infrastructure/repository/package_info/package_info_repository.dart';
import '../../../util/extension/target_platform_extension.dart';
import '../repository/app_config_document.dart';
import '../repository/app_config_repository.dart';

part 'app_config_state.g.dart';

/// [AppConfigDocument] を監視する。
@riverpod
Stream<AppConfigDocument> appConfig(AppConfigRef ref) {
  return ref.watch(appConfigRepositoryProvider).subscribeAppConfig();
}

/// アプリのアップデートが必要かどうかを保持する。
@riverpod
Future<bool> isRequiredAppUpdate(IsRequiredAppUpdateRef ref) async {
  // Web はデバッグでしか使わないため、常に false を返す。
  if (kIsWeb) {
    return false;
  }

  final appConfig = await ref.watch(appConfigProvider.future);
  final parsedRequiredVersion = defaultTargetPlatform.when(
    onIOS: () => Version.parse(appConfig.minAppVersionForIos),
    onAndroid: () => Version.parse(appConfig.minAppVersionForAndroid),
  );

  final currentAppVersion = ref.watch(packageInfoRepositoryProvider).appVersion;
  return parsedRequiredVersion > Version.parse(currentAppVersion);
}

/// アプリがメンテナンス中かどうかを保持する。
@riverpod
Future<bool> inMaintenance(InMaintenanceRef ref) async {
  final appConfig = await ref.watch(appConfigProvider.future);
  return appConfig.inMaintenance;
}
