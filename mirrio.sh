#!/usr/bin/env bash
set -o errexit
set -o pipefail

JOB_NAME=${JOB_NAME:-mirrIO}
RETENTION=${RETENTION:-30d0h0m}
ADDITIONAL_PARAMETERS=${ADDITIONAL_PARAMETERS:---quiet}
MC_BINARY=${MC_BINARY:-/work/mc}
MC_CONFIG_DIR=${MC_CONFIG_DIR:-/work/.mc}
mkdir -p "$MC_CONFIG_DIR"

# mc wrapper to use config dir
mc() { "$MC_BINARY" --config-dir "$MC_CONFIG_DIR" "$@"; }

pushgateway() {
  if [[ -n "${PUSHGATEWAY_URL:-}" ]]; then
    cat <<-EOF | curl --retry 3 --max-time 5 --silent --show-error \
      --data-binary @- "${PUSHGATEWAY_URL}/metrics/job/mirrio/instance/${JOB_NAME}" >/dev/null || true
      # TYPE mirrio_sync_failed gauge
      # HELP mirrio_sync_failed Whether the last sync failed
      mirrio_sync_failed $1
EOF
  fi
}

check_env() {
  for var in "$@"; do
    if [[ -z "${!var}" ]]; then
      echo "${var} is not set!"
      exit 1
    fi
  done
}

notify() {
  pushgateway 1
  echo "ERROR: Unable to sync!"
}

check_env \
  SOURCE_URL \
  SOURCE_ACCESSKEY \
  SOURCE_SECRETKEY \
  DESTINATION_URL \
  DESTINATION_ACCESSKEY \
  DESTINATION_SECRETKEY \
  SOURCE_BUCKET \
  DESTINATION_BUCKET

trap 'notify; exit 1' ERR

# Split extra parameters into an array so multiple flags work
# shellcheck disable=SC2206
read -r -a MC_MIRROR_ARGS <<<"${ADDITIONAL_PARAMETERS}"

mc alias set source "${SOURCE_URL}" "${SOURCE_ACCESSKEY}" "${SOURCE_SECRETKEY}" --api S3v4
mc alias set destination "${DESTINATION_URL}" "${DESTINATION_ACCESSKEY}" "${DESTINATION_SECRETKEY}" --api S3v4

# Create destination bucket if missing (ignore if it already exists)
mc mb --ignore-existing "destination/${DESTINATION_BUCKET}"

# Optional retention cleanup on SOURCE (only if bucket exists)
if mc ls "source/${SOURCE_BUCKET}" >/dev/null 2>&1; then
  mc rm --force --recursive --dangerous --older-than "${RETENTION}" "source/${SOURCE_BUCKET}"
fi

# Mirror with remove + any additional flags
mc mirror --remove "${MC_MIRROR_ARGS[@]}" "source/${SOURCE_BUCKET}" "destination/${DESTINATION_BUCKET}"

pushgateway 0
