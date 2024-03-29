# * Flutter プロジェクトを構築する
sh bin/set_up/create_flutter_project.sh

# * Firebase プロジェクトを構築する
sh bin/set_up/create_firebase_project.sh
sh bin/set_up/configure_firebase.sh

# * 作成したプロジェクトを VS Code で開く
code -n "$PROJECT_PATH/$APP_NAME"