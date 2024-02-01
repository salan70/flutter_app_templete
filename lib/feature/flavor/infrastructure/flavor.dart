import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/firebase_option/firebase_options_dev.dart' as dev_options;
import '../../../util/firebase_option/firebase_options_prod.dart' as prod_options;

part 'flavor.g.dart';

@Riverpod(keepAlive: true)
Flavor flavor(FlavorRef ref) => throw UnimplementedError();

enum Flavor {
  /// 開発環境。
  dev,

  /// 本番環境。
  prod;

  /// 環境変数に応じた [Flavor] を返す。
  static Flavor get fromEnvironment {
    const flavor = String.fromEnvironment('flavor');
    if (flavor == 'dev') {
      return Flavor.dev;
    } else if (flavor == 'prod') {
      return Flavor.prod;
    }
    throw AssertionError('No support flavor');
  }

  /// [Flavor] に応じた [FirebaseOptions] を返す。
  FirebaseOptions get firebaseOptions {
    switch (this) {
      case Flavor.dev:
        return dev_options.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod_options.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
