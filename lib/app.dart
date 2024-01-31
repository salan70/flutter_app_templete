import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/application/state/is_loading_overlay_state.dart';
import 'core/application/state/key_state.dart';
import 'core/presentation/common_widget/dialog/overlay_loading_dialog.dart';
import 'core/presentation/common_widget/error_and_retry_widget.dart';
import 'core/router/app_router.dart';
import 'feature/force_event/application/app_config_state.dart';
import 'feature/force_event/presentation/overlay_force_update_dialog.dart';
import 'feature/force_event/presentation/overlay_in_maintenance_dialog.dart';
import 'util/logger.dart';
import 'util/res/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'テンプレアプリ', // TODO(me): アプリ名を設定する。
      theme: getAppTheme(),
      darkTheme: getAppThemeDark(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: ref.watch(appRouterProvider).config(),
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        final nextApp = ScaffoldMessenger(
          key: ref.watch(scaffoldMessengerKeyProvider),
          child: DevicePreview.appBuilder(context, child),
        );

        // * メンテナンスの確認
        final maintenanceRelatedWidget = _handleMaintenance(
          asyncInMaintenance: ref.watch(inMaintenanceProvider),
          nextApp: nextApp,
          onRetry: () => ref.invalidate(inMaintenanceProvider),
        );
        if (maintenanceRelatedWidget != null) {
          return maintenanceRelatedWidget;
        }

        // * 強制アップデートの確認
        final forceUpdateRelatedWidget = _handleForceUpdate(
          asyncIsRequiredUpdate: ref.watch(isRequiredAppUpdateProvider),
          nextApp: nextApp,
          onRetry: () => ref.invalidate(isRequiredAppUpdateProvider),
        );
        if (forceUpdateRelatedWidget != null) {
          return forceUpdateRelatedWidget;
        }

        // * メンテナンス中でない かつ アップデートが不要な場合
        return Stack(
          children: [
            nextApp,
            if (ref.watch(isLoadingOverlayNotifierProvider))
              const OverlayLoadingDialog(),
          ],
        );
      },
    );
  }
}

/// [asyncInMaintenance] の状態に応じた Widget を返す。
///
/// メンテナンス中でない場合は null を返す。
Widget? _handleMaintenance({
  required AsyncValue<bool> asyncInMaintenance,
  required Widget nextApp,
  required VoidCallback onRetry,
}) {
  return asyncInMaintenance.when(
    loading: () => const Scaffold(body: OverlayLoadingDialog()),
    data: (inMaintenance) {
      logger.i('メンテナンス中かどうか: $inMaintenance');
      // ** メンテナンス中の場合
      if (inMaintenance) {
        return Stack(
          children: [
            nextApp,
            const OverlayInMaintenanceDialog(),
          ],
        );
      }
      return null;
    },
    error: (e, s) {
      // エラーが発生し、再読み込み中の場合。
      if (asyncInMaintenance.isLoading) {
        return const Scaffold(body: OverlayLoadingDialog());
      }
      logger.e(
        '[inMaintenance]の取得時にエラーが発生しました。',
        error: e,
        stackTrace: s,
      );
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ErrorAndRetryWidget.canInquire(
                onRetry: () => onRetry,
                inBaseRoute: false,
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// [asyncIsRequiredUpdate] の状態に応じた Widget を返す。
///
/// アップデートが必要ない場合は null を返す。
Widget? _handleForceUpdate({
  required AsyncValue<bool> asyncIsRequiredUpdate,
  required ScaffoldMessenger nextApp,
  required VoidCallback onRetry,
}) {
  return asyncIsRequiredUpdate.when(
    loading: () => const Scaffold(body: OverlayLoadingDialog()),
    data: (isRequiredUpdate) {
      // ** アップデートが必要な場合
      if (isRequiredUpdate) {
        return Stack(
          children: [
            nextApp,
            const OverlayForceUpdateDialog(),
          ],
        );
      }
      return null;
    },
    error: (e, s) {
      // エラーが発生し、再読み込み中の場合。
      if (asyncIsRequiredUpdate.isLoading) {
        return const Scaffold(body: OverlayLoadingDialog());
      }
      logger.e(
        '[isRequiredUpdate]の取得時にエラーが発生しました。',
        error: e,
        stackTrace: s,
      );
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ErrorAndRetryWidget.canInquire(
                onRetry: onRetry,
                inBaseRoute: false,
              ),
            ),
          ],
        ),
      );
    },
  );
}
