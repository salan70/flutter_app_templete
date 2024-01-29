import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuthRepository firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  return FirebaseAuthRepository(FirebaseAuth.instance);
}

class FirebaseAuthRepository {
  FirebaseAuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Stream<User?> get onUserChanged => _auth.userChanges();

  User? get authUser => _auth.currentUser;

  String? get loggedInUserId => _auth.currentUser?.uid;

  bool get isAnonymously => _auth.currentUser?.isAnonymous ?? false;

  Future<String?> get idToken async {
    return _auth.currentUser?.getIdToken(true);
  }

  Future<UserCredential> signInWithAnonymously() => _auth.signInAnonymously();

  Future<void> userDelete(User user) => user.delete();

  Future<void> signOut() => _auth.signOut();
}
