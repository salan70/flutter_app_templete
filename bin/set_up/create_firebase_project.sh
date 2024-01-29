# .env を読み込む。
source .env

# DOMAIN と APP_NAME から Firebase プロジェクト ID を生成する。
# 例: com.toda.FlutterAppTemplate → toda-flutter-app-template.
FIREBASE_PROJECT_ID="${DOMAIN#com.}-${APP_NAME//_/-}"

# プロジェクト ID を出力する。
echo "[$FIREBASE_PROJECT_ID-prod(dev)] という ID の Firebase プロジェクトを作成します。"

# APP_NAME から有効な iOS バンドル ID を生成する。
# 例: flutter_app_template → FlutterAppTemplate.
IOS_BUNDLE_ID=$(echo "$APP_NAME" | awk -F'_' '{for (i=1; i<=NF; i++) $i=toupper(substr($i, 1, 1)) substr($i, 2)} 1' OFS='')

cd terraform/firebase

# dev.
sh ../terraform.sh dev apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
                -var="project_name=${FIREBASE_PROJECT_ID}-dev" \
                -var="project_id=${FIREBASE_PROJECT_ID}-dev" \
                -var="android_package_name=${DOMAIN}.${APP_NAME}.dev" \
                -var="ios_bundle_id=${DOMAIN}.${IOS_BUNDLE_ID}.dev"

# prod.
sh ../terraform.sh prod apply -auto-approve -var="billing_account=$GOOGLE_CLOUD_BILLING_ACCOUNT_ID" \
                -var="project_name=${FIREBASE_PROJECT_ID}-prod" \
                -var="project_id=${FIREBASE_PROJECT_ID}-prod" \
                -var="android_package_name=${DOMAIN}.${APP_NAME}" \
                -var="ios_bundle_id=${DOMAIN}.${IOS_BUNDLE_ID}"