import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/infrastructure/repository/package_info/package_info_repository.dart';
import '../../../util/extension/context_extension.dart';
import '../../launch_url/application/launch_url_service.dart';
import '../../launch_url/util/url_constant.dart';

class SettingItemList extends ConsumerWidget {
  const SettingItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.watch(packageInfoRepositoryProvider).appVersion;
    final launchUrlService = ref.watch(launchUrlServiceProvider);

    return ListView(
      children: [
        const Gap(24),

        // * --------- サポート --------- * //
        const _SettingHeadlineWidget(title: 'サポート'),

        _SettingTileButton(
          trailingIcon: const Icon(CupertinoIcons.mail),
          label: 'お問い合わせ',
          onTap: () {
            // TODO(me): お問い合わせフォームに遷移させる。
            //   final currentUserId = ref.read(userIdProvider);
            //   final currentUserProfile =
            //       ref.read(userProfileProvider(currentUserId)).value;
            //   final url = inquireFormUrl(currentUserProfile?.publicId ?? '');

            //   ref
            //       .read(launchUrlControllerProvider)
            //       .launchURL(url, inBaseRoute: false);
          },
        ),
        const Gap(24),
        _SettingTileButton(
          trailingIcon: const Icon(CupertinoIcons.star),
          label: 'レビューで応援する',
          onTap: () {
            // TODO(me): レビュー画面に遷移させる。
            // ref
            //   .read(inAppReviewProvider)
            //   .openStoreListing(appStoreId: appleId);
          },
        ),
        const Gap(32),

        // * ------ アプリについて ------ * //
        const _SettingHeadlineWidget(title: 'アプリについて'),
        _SettingTileButton(
          trailingIcon: const Icon(CupertinoIcons.doc_text),
          label: '利用規約',
          onTap: () {
            launchUrlService.launchUrlInApp(termUrl);
          },
        ),
        const Gap(24),
        _SettingTileButton(
          trailingIcon: const Icon(CupertinoIcons.exclamationmark_shield),
          label: 'プライバシーポリシー',
          onTap: () {
            launchUrlService.launchUrlInApp(privacyPolicyUrl);
          },
        ),
        const Gap(24),
        _SettingTileButton(
          trailingIcon: const Icon(CupertinoIcons.tag),
          label: 'ライセンス',
          onTap: () async {
            // TODO(me): ライセンス画面に遷移させる。
            // await context.navigateTo(const MyLicenseRoute());
          },
        ),
        const Gap(24),
        Row(
          children: [
            const Icon(CupertinoIcons.info),
            const Gap(16),
            Expanded(
              child: Text(
                'バージョン',
                style: context.titleMedium,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                appVersion,
                style: context.bodyMedium,
              ),
            ),
            const Gap(4),
          ],
        ),
        const Gap(40),
      ],
    );
  }
}

/// 設定の各項目の見出し。
class _SettingHeadlineWidget extends StatelessWidget {
  const _SettingHeadlineWidget({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleSmall,
        ),
        const Gap(8),
      ],
    );
  }
}

/// 全体をタップできる設定項目。
class _SettingTileButton extends StatelessWidget {
  const _SettingTileButton({
    required this.trailingIcon,
    required this.label,
    required this.onTap,
  });

  final Icon trailingIcon;
  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          trailingIcon,
          const Gap(16),
          Expanded(
            child: Text(
              label,
              style: context.titleMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              CupertinoIcons.chevron_forward,
              size: 20,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
