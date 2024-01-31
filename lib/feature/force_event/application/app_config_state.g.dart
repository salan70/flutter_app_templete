// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appConfigHash() => r'7184af025c888eef1fddb970d717216637a878af';

/// [AppConfigDocument] を監視する。
///
/// Copied from [appConfig].
@ProviderFor(appConfig)
final appConfigProvider = AutoDisposeStreamProvider<AppConfigDocument>.internal(
  appConfig,
  name: r'appConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppConfigRef = AutoDisposeStreamProviderRef<AppConfigDocument>;
String _$isRequiredAppUpdateHash() =>
    r'8f5aa05d6c5d97442fcad7f73e99fea4d983bfe5';

/// アプリのアップデートが必要かどうかを保持する。
///
/// Copied from [isRequiredAppUpdate].
@ProviderFor(isRequiredAppUpdate)
final isRequiredAppUpdateProvider = AutoDisposeFutureProvider<bool>.internal(
  isRequiredAppUpdate,
  name: r'isRequiredAppUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isRequiredAppUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsRequiredAppUpdateRef = AutoDisposeFutureProviderRef<bool>;
String _$inMaintenanceHash() => r'05be438995a7b47516a7906a78269eee2fe8b4d7';

/// アプリがメンテナンス中かどうかを保持する。
///
/// Copied from [inMaintenance].
@ProviderFor(inMaintenance)
final inMaintenanceProvider = AutoDisposeFutureProvider<bool>.internal(
  inMaintenance,
  name: r'inMaintenanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inMaintenanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InMaintenanceRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
