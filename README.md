# templete_app

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
  fvm flutter run --debug --dart-define-from-file=dart_defines/dev.json
  ```

- 本番

  ```sh
  fvm flutter run --debug --dart-define-from-file=dart_defines/prod.json
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

3. 問題なければ新しい git repository を作成して本プロジェクトをプッシュする。

4. あとは良しなに使わないプラグインやコードを削除して開発を進めてください。
