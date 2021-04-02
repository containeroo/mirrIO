#!/usr/bin/env bash

set -o errexit

JOB_NAME=${JOB_NAME:-mirrIO}
RETENTION=${RETENTION:-30d0h0m}

function pushgateway {
	if [[ -n "${PUSHGATEWAY_URL}" ]]; then
		cat <<-EOF | curl --retry 3 --max-time 5 --silent --show-error --data-binary @- ${PUSHGATEWAY_URL}/metrics/job/mirrio/instance/${JOB_NAME} > /dev/null
			# TYPE mirrio_sync_failed gauge
			# HELP mirrio_sync_failed Whether the last sync failed
			mirrio_sync_failed $1
			EOF
	fi
}

function notify {
	pushgateway 1
	echo "ERROR: Unable to sync!"
}

[[ -z "${SOURCE_URL}" ]] && echo "SOURCE_URL is not set!" && exit 1
[[ -z "${SOURCE_ACCESSKEY}" ]] && echo "SOURCE_ACCESSKEY is not set!" && exit 1
[[ -z "${SOURCE_SECRETKEY}" ]] && echo "SOURCE_SECRETKEY is not set!" && exit 1
[[ -z "${DESTINATION_URL}" ]] && echo "DESTINATION_URL is not set!" && exit 1
[[ -z "${DESTINATION_ACCESSKEY}" ]] && echo "DESTINATION_ACCESSKEY is not set!" && exit 1
[[ -z "${DESTINATION_SECRETKEY}" ]] && echo "DESTINATION_SECRETKEY is not set!" && exit 1
[[ -z "${SOURCE_BUCKET}" ]] && echo "SOURCE_BUCKET is not set!" && exit 1
[[ -z "${DESTINATION_BUCKET}" ]] && echo "DESTINATION_BUCKET is not set!" && exit 1

trap notify ERR

mc config host add source ${SOURCE_URL} ${SOURCE_ACCESSKEY} ${SOURCE_SECRETKEY} --api S3v4

mc config host add destination ${DESTINATION_URL} ${DESTINATION_ACCESSKEY} ${DESTINATION_SECRETKEY} --api S3v4

mc ls destination | grep -q ${DESTINATION_BUCKET} || mc mb destination/${DESTINATION_BUCKET}

[[ -n $(mc ls source/${SOURCE_BUCKET}) ]] && mc rm --force --recursive --dangerous --older-than ${RETENTION} source/${SOURCE_BUCKET}

mc mirror source/${SOURCE_BUCKET} destination/${DESTINATION_BUCKET} --remove ${ADDITIONAL_PARAMETERS}

pushgateway 0
