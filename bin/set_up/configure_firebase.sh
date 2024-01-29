# * -- 必要な ID の生成 -- *
# .env を読み込む。
source .env

# DOMAIN と APP_NAME から Firebase プロジェクト ID を生成する。
# 例: com.toda.TemplateApp → toda-template-app.
FIREBASE_PROJECT_ID="${DOMAIN#com.}-${APP_NAME//_/-}"

# プロジェクト ID を出力する。
echo "[$FIREBASE_PROJECT_ID-prod(dev)] という ID の Firebase プロジェクトの構成ファイルを出力します。"

# APP_NAME から有効な iOS バンドル ID を生成する。
# 例: template_app → TemplateApp.
IOS_BUNDLE_ID=$(echo "$APP_NAME" | awk -F'_' '{for (i=1; i<=NF; i++) $i=toupper(substr($i, 1, 1)) substr($i, 2)} 1' OFS='')

# * -- flutterfire configure の実行 -- * #
# prod.
flutterfire configure \
  --project="${FIREBASE_PROJECT_ID}-prod" \
  --out=lib/util/firebase_option/firebase_options_prod.dart \
  --platforms=android,ios,web \
  --ios-bundle-id="${DOMAIN}.${IOS_BUNDLE_ID}" \
  --android-package-name="${DOMAIN}.${APP_NAME}" \
  --no-app-id-json

# dev.
flutterfire configure \
  --project="${FIREBASE_PROJECT_ID}-dev" \
  --out=lib/util/firebase_option/firebase_options_dev.dart \
  --platforms=android,ios,web \
  --ios-bundle-id="${DOMAIN}.${IOS_BUNDLE_ID}.dev" \
  --android-package-name="${DOMAIN}.${APP_NAME}.dev" \
  --no-app-id-json