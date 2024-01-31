import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/presentation/common_widget/button/my_button.dart';
import '../../../core/presentation/common_widget/dialog/base_overlay_dialog.dart';

/// アプリのアップデートが必要な場合に表示するダイアログ。
///
/// `Stack` を使用して、他の画面に重ねて表示することを想定している。
class OverlayForceUpdateDialog extends ConsumerWidget {
  const OverlayForceUpdateDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseOverlayDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(8),
          Text(
            '新たなバージョンが配信されています。\nアップデートをお願いします',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(16),
          MyButton(
            buttonName: 'update_button_in_force_update_dialog',
            onPressed: () {
              // TODO(me): タップ時の処理を書く。
              // defaultTargetPlatform.when(
              //   onIOS: () => ref
              //       .read(launchUrlControllerProvider)
              //       .launchURL(appStoreUrl, inBaseRoute: false),
              //   onAndroid: () => ref
              //       .read(launchUrlControllerProvider)
              //       .launchURL(googlePlayStoreUrl, inBaseRoute: false),
              // );
            },
            child: const Text('アップデートする'),
          ),
        ],
      ),
    );
  }
}
