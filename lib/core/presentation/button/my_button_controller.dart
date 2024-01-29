import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/logger.dart';
import '../../infrastructure/firebase_instance.dart';

part 'my_button_controller.g.dart';

@riverpod
MyButtonController myButtonController(MyButtonControllerRef ref) =>
    MyButtonController(ref);

/// `MyButton` のコントローラー。
class MyButtonController {
  MyButtonController(this.ref);

  final Ref ref;

  /// ボタンをタップしたログを Analytics に送信する。
  Future<void> logTapButton(String buttonName) async {
    try {
      await ref.read(analyticsProvider).logEvent(
        name: 'tap_button',
        parameters: {
          'button_name': buttonName,
        },
      );
    } on Exception catch (e, _) {
      logger.e('ボタンタップのログを送信時にエラーが発生。');
    }
  }
}
