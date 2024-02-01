import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import '../common_widget/button/my_button.dart';

@RoutePage()
class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('テンプレアプリ'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.gear),
            onPressed: () async {
              await context.pushRoute(const SettingRoute());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('テンプレアプリ'),
            MyButton(
              buttonName: 'top_button',
              onPressed: () {
                // TODO(me): タップ時の処理を書く。
              },
              child: const Text('トップボタン'),
            ),
          ],
        ),
      ),
    );
  }
}
