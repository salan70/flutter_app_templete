import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/infrastructure/firebase_instance.dart';
import '../../../util/mixin/presentation_mixin.dart';
import '../../analytics/util/firebase_analytics_extension.dart';
import '../../launch_url/application/launch_url_service.dart';
import '../../launch_url/util/url_constant.dart';

part 'setting_item_list_controller.g.dart';

@riverpod
SettingItemListController settingItemListController(
  SettingItemListControllerRef ref,
) =>
    SettingItemListController(ref);

class SettingItemListController with PresentationMixin {
  SettingItemListController(this.ref);

  final Ref ref;

  Future<void> onTapTermTile() async {
    await ref
        .read(analyticsProvider)
        .logTapEvent('to_term_tile_in_setting_page');

    await tryActionWithSnackBar(
      action: () async {
        await ref.read(launchUrlServiceProvider).launchUrlInApp(termUrl);
      },
      errorLogMessage: '利用規約ページへの遷移時にエラーが発生。',
    );
  }

  Future<void> onTapPrivacyPolicyTile() async {
    await ref
        .read(analyticsProvider)
        .logTapEvent('to_term_tile_in_setting_page');

    await tryActionWithSnackBar(
      action: () async {
        await ref
            .read(launchUrlServiceProvider)
            .launchUrlInApp(privacyPolicyUrl);
      },
      errorLogMessage: 'プライバシーポリシーページへの遷移時にエラーが発生。',
    );
  }
}
