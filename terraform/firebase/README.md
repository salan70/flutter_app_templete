# terraform/firebase

## 概要

Terraform を用いて以下を行います。

- Firebase プロジェクトの作成
- Firebase における Android/iOS アプリの設定
- Firestore を有効化
- Firestore にて、 app_config/app_config_doc を作成
  - 保持するフィールド/値は [app_config_document.json](./modules/firestore/app_config_document.json) を参照
- Storage を有効化
- Auchentication を有効化し、匿名認証を有効化

※ リージョンは asia-northeast1 

## 事前準備

- Terraform のインストール
- Google Cloud Billing Account の ID 取得
- gcloud コマンドのインストールとログイン

```sh
# gcloud のログイン用コマンド。
# それぞれブラウザが開き認証が求められる。
gcloud auth login
gcloud auth application-default login
```

## 実行コマンド

```sh
terraform init

# プロジェクト名や Google Cloud Billing Account の ID などの入力が求められる。
terraform plan

# アクションを実行するか問われた際、 yes と入力する。
terraform apply
```

## 参考

https://firebase.google.com/docs/projects/terraform/get-started?hl=ja#supported-resources

https://zenn.dev/waddy/articles/terraform-google-cloud

https://zenn.dev/cloud_ace/articles/b791cce386d523