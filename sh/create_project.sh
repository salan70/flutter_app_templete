# .env を読み込む。
source .env

# * Flutter プロジェクトの構築
# ** プロジェクトディレクトリの作成
# 新たにディレクトリを作成し、本プロジェクトの内容をコピーする。
mkdir -p "$PROJECT_PATH/$APP_NAME"
cp -rf ./* "$PROJECT_PATH/$APP_NAME"

# ** アプリ名/パッケージ名の変更
cd "$PROJECT_PATH/$APP_NAME"

# Android.
fvm dart pub get
fvm dart pub run change_app_package_name:main ${DOMAIN}.${APP_NAME}

# iOS.
IOS_PROJECT_PATH="./ios/Runner.xcodeproj/project.pbxproj"
sed -i '' "s/com.example.app/${DOMAIN}.${APP_NAME}/g" $IOS_PROJECT_PATH

# 共通。
# dart_defines 内の appName を更新する。
jq '.appName = "'$APP_NAME'"' dart_defines/dev.json > tmp.$$ && mv tmp.$$ dart_defines/dev.json
jq '.appName = "'$APP_NAME'"' dart_defines/prod.json > tmp.$$ && mv tmp.$$ dart_defines/prod.json

# pubspec.yaml を更新する。
sed -i '' "s/name: .*/name: $APP_NAME/" pubspec.yaml

# * Firebase プロジェクトの構築
# cd terraform/firebase

# # dev 環境。
# # Terraform の初期化と状態ファイル削除を行う。
# terraform init
# rm -f terraform.tfstate terraform.tfstate.backup

# terraform apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
#                 -var="project_name=${FIREBASE_PROJECT_ID}-dev" \
#                 -var="project_id=${FIREBASE_PROJECT_ID}-dev" \
#                 -var="android_package_name=${DOMAIN}.${APP_NAME}.dev" \
#                 -var="ios_bundle_id=${DOMAIN}.${APP_NAME}.dev"

# # prod 環境。
# # 改めて Terraform の初期化と状態ファイル削除を行う。
# terraform init
# rm -f terraform.tfstate terraform.tfstate.backup

# terraform apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
#                 -var="project_name=${FIREBASE_PROJECT_ID}-prod" \
#                 -var="project_id=${FIREBASE_PROJECT_ID}-prod" \
#                 -var="android_package_name=${DOMAIN}.${APP_NAME}" \
#                 -var="ios_bundle_id=${DOMAIN}.${APP_NAME}"

# * 作成したプロジェクトを VS Code で開く
code -n "$PROJECT_PATH/$APP_NAME"