# flutter_app_template

Flutter + Firebase アプリのテンプレート。

## 使い方

### 事前準備

```sh
# jq をインストールする。
brew install  jq

# flutterfire_cli をインストールする。
fvm dart pub global activate flutterfire_cli
```

## 実装済み

- Firebase を利用 (Authentication, Firestore, Functions, Analytics, Crashlytics)
- 起動時に匿名認証でログイン
- デバイス向きを縦で固定
- 静的解析導入
- Android/iOS の Flavor 設定
- iOS 日本語デフォルト
- よく使うパッケージの設定
- fvm の設定

## やっていないこと

- Android/iOS ローカル通知とプッシュ通知の設定
- Android の keystore の設定 (debug, release)
- ローカライズ対応
- Web 対応

## 設計指針

### ディレクトリ構成

<!-- あくまで一例。 PJ に応じて適宜修正する。 -->

- lib/
  - core/
    - common_widget/
    - constant/
    - exception/
    - extension/
  - feature/
    - XX (関心事)
      - ui/
        - XX_page/
          - component/
          - XX_page.dart
          - XX_controller.dart
      - model/
      - repository/
      - util/
  - app.dart
  - main.dart

### Flavor

| 環境 | パッケージ名        | アプリ名           |
| ---- | ------------------- | ------------------ |
| 開発 | com.example.app.dev | dev.テンプレアプリ |
| 本番 | com.example.app     | 　テンプレアプリ   |

### 実行コマンド

- 開発

  ```sh
  flutter run --debug --dart-define-from-file=dart_defines/dev.json
  ```

- 本番

  ```sh
  flutter run --debug --dart-define-from-file=dart_defines/prod.json
  ```

## 新規プロジェクトへの移行方法

1. git clone で取り込み、作業用ディレクトリへコピーする

    ```sh
    git clone https://github.com/hukusuke1007/flutter_app_template.git
    cp -rf feature_first/ [作業用ディレクトリのパス]
    cd [作業用ディレクトリのパス]
    ```

2. 取り込み後、作業用ディレクトリ内の`.git`を削除する

    ```sh
    rm -rf .git
    ```

3. 変更したいアプリ名、パッケージ名、プロジェクト名 にする。以下の通り手動で修正するか、[change_app_package_name](https://pub.dev/packages/change_app_package_name)を使って自動で修正する。

    - アプリ名を変更する
      - [dart-definesディレクトリ](./dart_defines/)内にあるjsonファイルの `appName` を変更する
  
    - `com.example.app` のパッケージ名を変更する
      - iOS:

        `Xcode > Runner > TARGETS Runner > Build Settings` の `Product Bundle Identifier` を変更。
        Debug, Profile, Release の全てを変更する。`$(appIdSuffix)`はそのままにしてください。
        ![dev](./doc/images/product_bundle_identifier.png)

      - Android:

        - android/app/build.gradle
          - [applicationId](./android/app/build.gradle#L63)
        - AndroidManifest.xml - package

          - [main](./android/app/src/main/AndroidManifest.xml#L2)
          - [debug](./android/app/src/debug/AndroidManifest.xml#L2)
          - [profile](./android/app/src/profile/AndroidManifest.xml#L2)

        - MainActivity.kt
          - [package](./android/app/src/main/kotlin/com/example/app/MainActivity.kt#L1)

        - ScreenReaderPlugin.kt
          - [package1](./android/app/src/main/kotlin/com/example/app/ScreenReaderPlugin.kt#L1)
          - [package2](./android/app/src/main/kotlin/com/example/app/ScreenReaderPlugin.kt#L15)
          - [package3](./android/app/src/main/kotlin/com/example/app/ScreenReaderPlugin.kt#L25)

        - kotlin 配下のディレクトリ名を変更する

          （例）`com.example.app` から `com.never.jp` へ変更した場合

          ```md
            変更前: android/app/src/main/kotlin/com/example/app
            変更後: android/app/src/main/kotlin/com/never/jp
          ```

    - プロジェクト名を変更する
      - [pubspec.yaml の name](./pubspec.yaml#L1)

4. 新しい Firebase プロジェクトを構築する。
    開発環境、本番環境の 2 種類用意する。なお、開発環境のパッケージ名の末尾は必ず `.dev` を付与する。

    - [Firebase の構築方法](https://firebase.flutter.dev/docs/overview)

    構築した Firebase の設定ファイルを以下の場所へ設置する

    - Android

      ```md
      # 開発環境
      android/app/src/dev/google-services.json
      # 本番環境
      android/app/src/prod/google-services.json
      ```

    - iOS

      ```md
      # 開発環境
      ios/dev/GoogleService-Info.plist
      # 本番環境
      ios/prod/GoogleService-Info.plist
      ```

5. Firebase コンソールから匿名認証を 開発環境、本番環境共に ON にする

6. Flutter のライブラリを取り込む。 pub get を実行する。
    利用するバージョンを固定にするため、[pubspec.lock](./pubspec.lock) 内のプラグインのバージョンを見て [pubspec.yaml](./pubspec.yaml) のプラグインのバージョンを指定する。

7. [実行コマンド](#実行コマンド)を用いて動作確認する。

8. 問題なければ新しい git repository を作成して本プロジェクトをプッシュする。

9. あとは良しなに使わないプラグインやコードを削除して開発を進めてください。
