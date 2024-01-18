# TODO(me): コメントアウトを外すか、ファイルを削除する。
# 本ファイルを使用するか不明なため、コメントアウトとしている。
# `firebase_options_prod (dev).dart` を用意するだけで Firebase の各アプリを使えるのであれば、
# 本ファイルを使用する。

# # .env を読み込む。
# source .env

# # DOMAIN と APP_NAME から Firebase プロジェクト ID を生成する。
# # 例: com.toda.FlutterAppTemplate → toda-flutter-app-template.
# FIREBASE_PROJECT_ID="${DOMAIN#com.}-${APP_NAME//_/-}"

# # プロジェクト ID を出力する。
# echo "[$FIREBASE_PROJECT_ID-prod(dev)] という ID の Firebase プロジェクトを作成します。"

# # APP_NAME から有効な iOS バンドル ID を生成する。
# # 例: flutter_app_template → FlutterAppTemplate.
# IOS_BUNDLE_ID=$(echo "$APP_NAME" | awk -F'_' '{for (i=1; i<=NF; i++) $i=toupper(substr($i, 1, 1)) substr($i, 2)} 1' OFS='')

# # prod.
# flutterfire configure \
#   --project="${FIREBASE_PROJECT_ID}-prod" \
#   --out=lib/core/util/firebase_option/firebase_options_prod.dart \
#   --platforms=android,ios \
#   --ios-bundle-id="${IOS_BUNDLE_ID}" \
#   --android-package-name="${DOMAIN}.${APP_NAME}" \
#   --no-apply-gradle-plugins \
#   --no-app-id-json

# # dev.
# flutterfire configure \
#   --project="${FIREBASE_PROJECT_ID}-dev" \
#   --out=lib/core/util/firebase_option/firebase_options_dev.dart \
#   --platforms=android,ios \
#   --ios-bundle-id="${IOS_BUNDLE_ID}.dev" \
#   --android-package-name="${DOMAIN}.${APP_NAME}.dev" \
#   --no-apply-gradle-plugins \
#   --no-app-id-json