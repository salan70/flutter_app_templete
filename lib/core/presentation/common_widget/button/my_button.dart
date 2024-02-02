import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../feature/analytics/util/firebase_analytics_extension.dart';
import '../../../infrastructure/firebase_instance.dart';

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
      // `onPressed` が null の場合はボタンを押せないようにする。
      onPressed: onPressed == null
          ? null
          : () async {
              await ref.read(analyticsProvider).logTapEvent(buttonName);
              onPressed!();
            },
      child: child,
    );
  }
}
