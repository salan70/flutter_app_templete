# .env を読み込む。
source .env

# ** プロジェクトディレクトリの作成
# 新たにディレクトリを作成し、本プロジェクトの内容をコピーする。
mkdir -p "$PROJECT_PATH/$APP_NAME"
cp -rf ./* "$PROJECT_PATH/$APP_NAME"

# ** アプリ名/パッケージ名の変更
echo "[${DOMAIN}.${APP_NAME}] にアプリ名/パッケージ名を変更します。"

cd "$PROJECT_PATH/$APP_NAME"

# Android.
fvm dart pub get
fvm dart pub run change_app_package_name:main ${DOMAIN}.${APP_NAME}

# iOS.
# APP_NAME から有効な iOS バンドル ID を生成する。
# 例: template_app → templateApp.
IOS_BUNDLE_ID=$(echo "$APP_NAME" | awk -F'_' '{for (i=1; i<=NF; i++) $i=(i==1 ? tolower(substr($i, 1, 1)) : toupper(substr($i, 1, 1))) substr($i, 2)} 1' OFS='')
IOS_PROJECT_PATH="./ios/Runner.xcodeproj/project.pbxproj"
# 初期時のバンドル ID.
DEFAULT_IOS_BUNDLE_ID="com.toda.templateApp"
sed -i '' "s/${DEFAULT_IOS_BUNDLE_ID}/${DOMAIN}.${IOS_BUNDLE_ID}/g" $IOS_PROJECT_PATH

# TODO(me): Web のパッケージ名の変更を実装する。

# 共通。
# dart_defines 内の appName を更新する。
jq '.appName = "'$APP_NAME.dev'"' dart_defines/dev.json > tmp.$$ && mv tmp.$$ dart_defines/dev.json
jq '.appName = "'$APP_NAME'"' dart_defines/prod.json > tmp.$$ && mv tmp.$$ dart_defines/prod.json
# pubspec.yaml を更新する。
sed -i '' "s/name: .*/name: $APP_NAME/" pubspec.yaml

