import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/infrastructure/repository/package_info/package_info_repository.dart';
import '../../../util/extension/context_extension.dart';
import 'setting_item_list_controller.dart';

class SettingItemList extends ConsumerWidget {
  const SettingItemList({super.key});

  /// すべての要素に適用される padding.
  EdgeInsets get _tileBasePadding => const EdgeInsets.only(
        right: 16,
        left: 20,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.watch(packageInfoRepositoryProvider).appVersion;
    final controller = ref.watch(settingItemListControllerProvider);

    return ListView(
      children: [
        const Gap(12),
        // * --------- サポート --------- * //
        _SettingHeadlineWidget(
          title: 'サポート',
          tileBasePadding: _tileBasePadding,
        ),
        _SettingTileButton(
          tileBasePadding: _tileBasePadding,
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
        _SettingTileButton(
          tileBasePadding: _tileBasePadding,
          trailingIcon: const Icon(CupertinoIcons.star),
          label: 'レビューで応援する',
          onTap: () {
            // TODO(me): レビュー画面に遷移させる。
            // ref
            //   .read(inAppReviewProvider)
            //   .openStoreListing(appStoreId: appleId);
          },
        ),

        // * ------ アプリについて ------ * //
        _SettingHeadlineWidget(
          title: 'アプリについて',
          tileBasePadding: _tileBasePadding,
        ),
        _SettingTileButton(
          tileBasePadding: _tileBasePadding,
          trailingIcon: const Icon(CupertinoIcons.doc_text),
          label: '利用規約',
          onTap: controller.onTapTermTile,
        ),
        _SettingTileButton(
          tileBasePadding: _tileBasePadding,
          trailingIcon: const Icon(CupertinoIcons.exclamationmark_shield),
          label: 'プライバシーポリシー',
          onTap: controller.onTapPrivacyPolicyTile,
        ),
        _SettingTileButton(
          tileBasePadding: _tileBasePadding,
          trailingIcon: const Icon(CupertinoIcons.tag),
          label: 'ライセンス',
          onTap: () async {
            // TODO(me): ライセンス画面に遷移させる。
            // await context.navigateTo(const MyLicenseRoute());
          },
        ),
        _SettingTile(
          tileBasePadding: _tileBasePadding + const EdgeInsets.only(right: 4),
          leadingIcon: const Icon(CupertinoIcons.info),
          label: 'バージョン',
          trailingWidget: Text(
            appVersion,
            style: context.bodyMedium,
          ),
        ),
        const Gap(40),
      ],
    );
  }
}

/// 設定の各項目の見出し。
class _SettingHeadlineWidget extends StatelessWidget {
  const _SettingHeadlineWidget({
    required this.title,
    required this.tileBasePadding,
  });

  final String title;
  final EdgeInsets tileBasePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: tileBasePadding.copyWith(top: 16),
      child: Text(
        title,
        style: context.titleSmall,
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.tileBasePadding,
    required this.leadingIcon,
    required this.label,
    required this.trailingWidget,
  });

  final EdgeInsets tileBasePadding;
  final Icon leadingIcon;
  final String label;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: tileBasePadding.copyWith(top: 12, bottom: 12),
      child: Row(
        children: [
          leadingIcon,
          const Gap(16),
          Expanded(
            child: Text(
              label,
              style: context.titleMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: trailingWidget,
          ),
        ],
      ),
    );
  }
}

/// 全体をタップできる設定タイル。
class _SettingTileButton extends StatelessWidget {
  const _SettingTileButton({
    required this.tileBasePadding,
    required this.trailingIcon,
    required this.label,
    required this.onTap,
  });

  final EdgeInsets tileBasePadding;
  final Icon trailingIcon;
  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _SettingTile(
        tileBasePadding: tileBasePadding,
        leadingIcon: trailingIcon,
        label: label,
        trailingWidget: Icon(
          CupertinoIcons.chevron_forward,
          size: 20,
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
