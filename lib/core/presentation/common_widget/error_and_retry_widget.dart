import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'button/my_button.dart';

/// エラーが発生した際に表示する Widget。
class ErrorAndRetryWidget extends ConsumerWidget {
  /// お問い合わせボタンを表示しない [ErrorAndRetryWidget].
  const ErrorAndRetryWidget.cannotInquire({
    super.key,
    required this.onRetry,
  })  : showInquireButton = false,
        inBaseRoute = null;

  /// お問い合わせボタンを表示する [ErrorAndRetryWidget].
  const ErrorAndRetryWidget.canInquire({
    super.key,
    required this.onRetry,
    required this.inBaseRoute,
  }) : showInquireButton = true;

  /// リトライ時の処理。
  final VoidCallback onRetry;

  /// お問い合わせボタンを表示するかどうか。
  final bool showInquireButton;

  /// 表示する Page が BaseRoute 内かどうか。（ BottomNavBar を表示するかどうか。）
  final bool? inBaseRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Icon(
          CupertinoIcons.exclamationmark_circle_fill,
          color: Theme.of(context).colorScheme.error,
          size: 24,
        ),
        const Gap(8),
        Text(
          'エラーが発生しました。',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap(8),
        Text(
          '再読み込みをお試しください。',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '繰り返し発生する場合は、運営へお問い合わせください。',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(24),
        MyButton(
          buttonName: 'retry_button_in_error_and_retry_widget',
          onPressed: onRetry,
          child: const Text('再読み込み'),
        ),
        showInquireButton
            ? Column(
                children: [
                  const Gap(24),
                  MyButton(
                    buttonName: 'inquire_button_in_error_and_retry_widget',
                    onPressed: () {
                      // TODO(me): タップ時の処理を書く。
                      // final currentUserId = ref.read(userIdProvider);

                      // String? publicId;
                      // if (currentUserId != null) {
                      //   publicId = ref
                      //       .read(userProfileProvider(currentUserId))
                      //       .value
                      //       ?.publicId;
                      // }
                      // final url = inquireFormUrl(publicId ?? '');

                      // // `showInquireButton` が true の場合、
                      // // `inBaseRoute` は必ず null ではない。
                      // ref
                      //     .read(launchUrlControllerProvider)
                      //     .launchURL(url, inBaseRoute: inBaseRoute!);
                    },
                    child: const Text('運営へお問い合わせ'),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

/// [ErrorAndRetryWidget] の簡易版。
class SimpleErrorAndRetryWidget extends StatelessWidget {
  const SimpleErrorAndRetryWidget({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRetry,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle_fill,
                color: Theme.of(context).colorScheme.error,
                size: 24,
              ),
              const Gap(8),
              Text(
                'エラー',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            'タップで再読み込み',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
