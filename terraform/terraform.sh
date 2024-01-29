# 参考
# https://zenn.dev/smartround_dev/articles/5e20fa7223f0fd#複数環境を楽に安全に切り替えるためのラッパースクリプト(terraform.sh)

set -euo pipefail

function usage() {
  cat <<EOF
Usage: [TF_SKIP_INIT=boolean ] $0 [-help] <env> <command> [args]
  env          : environment [stg/prd/...]
  command      : terraform command [plan/apply/state/...]
  args         : subcommand [e.g. state "mv"] and terraform command options (see : terraform <command> -help)
  TF_SKIP_INIT : skip "terraform init"
EOF
}

# * ------------------------------ Main ------------------------------ *

if [ "$1" = '-h' ] || [ "$1" = '-help' ] ; then
  usage
  exit 0
fi

# <command>以降が無い時はエラーとする。
if [ $# -lt 2 ] ; then
  echo -e "[ERROR] Invalid parameters\n"
  usage
  exit 128
fi

TF_ENV=$1
TF_COMMAND=$2
TF_ARGS=${@:3}

# set -uしているので、${TF_SKIP_INIT-false}とすることで、
# ${TF_SKIP_INIT}が未定義の場合でもエラーとならずfalseとして扱われるようにしている。
if [ "${TF_SKIP_INIT-false}" = true ] ; then
  echo "[INFO] Skip init..."
else
  if [ "${TF_COMMAND}" = 'init' ] ; then
    # shellcheck disable=SC2086.
    terraform init \
      -backend-config="environments/${TF_ENV}/${TF_ENV}.tfbackend" \
      -reconfigure \
      ${TF_ARGS} # ./terraform.sh <env> init [args] が実行された時の [args] は、init用向けに指定されたものと解釈し、ここで展開する。
    exit 0 # ./terraform.sh <env> init が実行された時はここで終了させる。
  else
    terraform init \
      -backend-config="environments/${TF_ENV}/${TF_ENV}.tfbackend" \
      -reconfigure # Do you want to copy existing state to the new backend? を非表示にするため。
  fi
fi

# -var-fileオプションの無いコマンドに-var-fileを指定するとエラーになる場合があるので処理を分岐させる。
case $TF_COMMAND in
  apply | console | destroy | import | plan | refresh)
    # shellcheck disable=SC2086.
    # "${TF_ARGS}"が推奨だが複数引数を指定した時にエラーになるのでダブルクォートは外す。
    terraform "${TF_COMMAND}" -var-file="environments/${TF_ENV}/${TF_ENV}.tfvars" ${TF_ARGS};;
  *)
    # shellcheck disable=SC2086.
    terraform "${TF_COMMAND}" ${TF_ARGS};;
esac