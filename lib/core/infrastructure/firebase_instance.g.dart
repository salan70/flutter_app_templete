// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_instance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthHash() => r'c8e57c3e164ad1c2cad48c4508e47f6097e350a7';

/// See also [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = Provider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthRef = ProviderRef<FirebaseAuth>;
String _$firestoreHash() => r'4963ca786eb54685cef6453544040c7567e77c0f';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = Provider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRef = ProviderRef<FirebaseFirestore>;
String _$analyticsHash() => r'fce208844f3a304fc84790b7a29747afc05f6316';

/// See also [analytics].
@ProviderFor(analytics)
final analyticsProvider = AutoDisposeProvider<FirebaseAnalytics>.internal(
  analytics,
  name: r'analyticsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$analyticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalyticsRef = AutoDisposeProviderRef<FirebaseAnalytics>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
