#!/usr/bin/env bash

set -o errexit

JOB_NAME=${JOB_NAME:-mirrIO}
RETENTION=${RETENTION:-30d0h0m}
ADDITIONAL_PARAMETERS=${ADDITIONAL_PARAMETERS:---quiet}

function pushgateway {
	if [[ -n "${PUSHGATEWAY_URL}" ]]; then
		cat <<-EOF | curl --retry 3 --max-time 5 --silent --show-error --data-binary @- "${PUSHGATEWAY_URL}/metrics/job/mirrio/instance/${JOB_NAME}" >/dev/null
			# TYPE mirrio_sync_failed gauge
			# HELP mirrio_sync_failed Whether the last sync failed
			mirrio_sync_failed $1
		EOF
	fi
}

function check_env {
	for var in "$@"; do
		if [[ -z "${!var}" ]]; then
			echo "${var} is not set!"
			exit 1
		fi
	done
}

function notify {
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

trap notify ERR

mc config host add source "${SOURCE_URL}" "${SOURCE_ACCESSKEY}" "${SOURCE_SECRETKEY}" --api S3v4

mc config host add destination "${DESTINATION_URL}" "${DESTINATION_ACCESSKEY}" "${DESTINATION_SECRETKEY}" --api S3v4

mc ls destination | grep -q "${DESTINATION_BUCKET}" || mc mb "destination/${DESTINATION_BUCKET}"

[[ -n $(mc ls "source/${SOURCE_BUCKET}") ]] && mc rm --force --recursive --dangerous --older-than "${RETENTION}" "source/${SOURCE_BUCKET}"

mc mirror --remove "${ADDITIONAL_PARAMETERS}" "source/${SOURCE_BUCKET}" "destination/${DESTINATION_BUCKET}"

pushgateway 0
