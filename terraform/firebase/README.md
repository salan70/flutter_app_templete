# terraform/firebase

## 概要

Terraform を用いて以下を行います。

- Firebase プロジェクトの作成（dev, prod の2環境分）
- Firebase における Android/iOS アプリの設定
- Firestore を有効化
- Firestore にて、 app_config/app_config_doc を作成
  - 保持するフィールド/値は [app_config_document.json](./modules/firestore/app_config_document.json) を参照
- Storage を有効化
- Auchentication を有効化し、匿名認証を有効化

※ リージョンは asia-northeast1 

なお、以下は行いませんので、 Firebase コンソール等にて手動で行う必要があります。

- Analytics を有効化
- google-services.json / GoogleService-Info.plist のダウンロード

## やること

### 0. 事前準備

- Terraform のインストール
- Google Cloud Billing Account の ID 取得
- （あれば）以下ファイルを削除
  - tfstate/dev/terraform.tfstate
  - tfstate/dev/terraform.tfstate.backup
  - tfstate/prod/terraform.tfstate
  - tfstate/prod/terraform.tfstate.backup
  - .terraform.lock.hcl
  - 
- gcloud コマンドのインストールとログイン

```sh
# gcloud のログイン用コマンド。
# それぞれブラウザが開き認証が求められる。
gcloud auth login
gcloud auth application-default login
```

### 1. Terraform を実行

- dev, prod それぞれコマンドを実行する必要があります。
- 以下を引数として渡す必要があります。
  - GOOGLE_CLOUD_BILLING_ACCOUNT_ID
  - FIREBASE_PROJECT_ID
  - DOMAIN
  - APP_NAME
  - IOS_BUNDLE_ID
- 本リポジトリにおいては、 [lib/set_up/create_firebase_project.sh](bin/set_up/create_firebase_project.sh) での実行を想定しています。

```sh
# dev.
sh terraform.sh dev apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
                -var="project_name=${FIREBASE_PROJECT_ID}-dev" \
                -var="project_id=${FIREBASE_PROJECT_ID}-dev" \
                -var="android_package_name=${DOMAIN}.${APP_NAME}.dev" \
                -var="ios_bundle_id=${DOMAIN}.${IOS_BUNDLE_ID}.dev"

# prod.
sh terraform.sh prod apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
                -var="project_name=${FIREBASE_PROJECT_ID}-prod" \
                -var="project_id=${FIREBASE_PROJECT_ID}-prod" \
                -var="android_package_name=${DOMAIN}.${APP_NAME}" \
                -var="ios_bundle_id=${DOMAIN}.${IOS_BUNDLE_ID}"
```

### 2. Firebase コンソール上での操作

- 作成した Firebase プロジェクトを開き、 Analytics を有効化してください。

## トラブルシューティング

- Terraform の実行がうまく行かない場合、以下を試してみてください。
  - gcloud のログインを再度行う
  - FIREBASE_PROJECT_ID が一意かどうか確認する
  - .tarraform.lock.hcl や .tfstate 系のファイルを削除する
  - Firebase プロジェクトの作成上限に達していないか確認する

## 参考

https://firebase.google.com/docs/projects/terraform/get-started?hl=ja#supported-resources

https://zenn.dev/waddy/articles/terraform-google-cloud

https://zenn.dev/cloud_ace/articles/b791cce386d523