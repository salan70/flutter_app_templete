import 'package:firebase_analytics/firebase_analytics.dart';

import '../../../util/logger.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  /// [FirebaseAnalytics] に対して、タップイベントを送信する。
  ///
  /// 例外が発生した場合、アプリ内でエラーログを出力する。
  /// エラーログを出力するだけで、例外を再スローしないことに注意。
  Future<void> logTapEvent(String buttonName) async {
    try {
      await logEvent(
        name: 'tap_event',
        parameters: {
          'button_name': buttonName,
        },
      );
    } on Exception catch (e, s) {
      logger.e(
        'ボタンタップのログを送信時にエラーが発生。',
        error: e,
        stackTrace: s,
      );
    }
  }
}
