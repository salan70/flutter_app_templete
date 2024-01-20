# flutter clean + flutter pub get.
clean_pub_get:
	fvm flutter clean
	fvm flutter pub get

# コードを自動生成する。
generate:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# アイコンを作成する。
create_icon:
	fvm flutter pub run flutter_launcher_icons:main

# テストを実行する。
test:
	fvm flutter test

# テストを実行しカバレッジの html ファイルを開く。
test_coverage:
	fvm flutter test --coverage
	lcov --remove coverage/lcov.info '*.freezed.dart' '*.g.dart' '*/repository*' -o coverage/lcov.info
	genhtml coverage/lcov.info -o coverage/html
	open /Users/odatetsuo/Projects/teigi_app/coverage/html/index.html


# * --- リリースビルド --- * #
# Android.
release_build_android:
	flutter build appbundle --release --dart-define=FLAVOR=prod --target lib/main.dart

# Android + 難読化
release_build_obfuscate_android:
	flutter build appbundle --release --obfuscate --split-debug-info=obfuscate/android --dart-define=FLAVOR=prod --target lib/main.dart

# iOS.
release_build_ios:
	flutter build ipa --release --dart-define=FLAVOR=prod --target lib/main.dart

# iOS + 難読化
release_build_obfuscate_ios:
	flutter build ipa --release --obfuscate --split-debug-info=obfuscate/ios --dart-define=FLAVOR=prod --target lib/main.dart