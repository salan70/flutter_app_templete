import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_button_controller.dart';

/// アプリ内で使用するボタン。
///
/// ボタンをタップしたことを Analytics に送信する。
/// 送信するボタンの名称は [buttonName] で指定した文字列になる。
class MyButton extends ConsumerWidget {
  const MyButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.child,
  });

  /// Analytics に送信するためのボタンの名称。
  ///
  /// スネークケースのアルファベットで記述すること。
  final String buttonName;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        await ref.read(myButtonControllerProvider).logTapButton(buttonName);
        onPressed?.call();
      },
      child: child,
    );
  }
}
