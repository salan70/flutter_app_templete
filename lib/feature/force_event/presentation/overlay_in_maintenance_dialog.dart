import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/presentation/common_widget/button/my_button.dart';
import '../../../core/presentation/common_widget/dialog/base_overlay_dialog.dart';

/// メンテナンス中に表示するダイアログ。
///
/// `Stack` を使用して、他の画面に重ねて表示することを想定している。
class OverlayInMaintenanceDialog extends StatelessWidget {
  const OverlayInMaintenanceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseOverlayDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(8),
          Text(
            '🤖現在メンテナンス中です🤖',
            // '\n終了予定は${appMaintenance.scheduledEndTime}です。',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(16),
          Text(
            'ご不便をおかけし申し訳ございません🙇‍♂\n'
            '詳しい情報は下記からご確認いただけます。',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(16),
          MyButton(
            buttonName: 'latest_information_button_in_maintenance_dialog',
            onPressed: () {
              // TODO(me): タップ時の処理を書く。
              // ref.read(launchUrlControllerProvider).launchURL(
              //       latestInformationPageUrl,
              //       inBaseRoute: false,
              //     );
            },
            child: const Text('最新情報を確認する'),
          ),
        ],
      ),
    );
  }
}
