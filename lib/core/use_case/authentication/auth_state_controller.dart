import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/firebase_auth/firebase_auth_repository.dart';

part 'auth_state_controller.g.dart';

/// 認証状態
enum AuthState {
  /// サインインしていない
  noSignIn,

  /// 匿名認証
  signInWithAnonymously;

  bool get isSignIn => this != noSignIn;
}

@Riverpod(keepAlive: true)
class AuthStateController extends _$AuthStateController {
  @override
  AuthState build() {
    final repository = ref.watch(firebaseAuthRepositoryProvider);
    if (repository.authUser == null) {
      return AuthState.noSignIn;
    } else {
      return AuthState.signInWithAnonymously;
    }
  }

  void update(AuthState authState) {
    state = authState;
  }
}
