import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/setting/presentation/setting_item_list.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.xmark),
            onPressed: () async {
              await context.popRoute();
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 20,
        ),
        child: SettingItemList(),
      ),
    );
  }
}
