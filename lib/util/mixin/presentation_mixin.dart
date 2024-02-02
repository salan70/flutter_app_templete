import '../logger.dart';

/// Presentation 層で使用する Mixin.
///
/// View, Controller 両方での使用を想定している。
mixin PresentationMixin {
  /// [action] を実行し、
  /// 例外が発生した場合は「エラーログの出力」と「スナックバーの表示」を行う。
  Future<void> tryActionWithSnackBar({
    required Future<void> Function() action,
    required String errorLogMessage,
  }) async {
    try {
      await action();
    } on Exception catch (e, s) {
      logger.e(errorLogMessage, error: e, stackTrace: s);
      // TODO(me): スナックバーを表示する
    }
  }
}
