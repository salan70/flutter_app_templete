import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading_overlay_state.g.dart';

/// オーバーレイローディングを表示させるかどうかを管理する。
/// 
/// 初期状態は false (非表示).
@riverpod
class IsLoadingOverlayNotifier extends _$IsLoadingOverlayNotifier {
  @override
  bool build() {
    return false;
  }

  /// オーバーレイローディングを表示させる。
  void startLoading() {
    state = true;
  }

  /// オーバーレイローディングを非表示にする。
  void finishLoading() {
    state = false;
  }
}
