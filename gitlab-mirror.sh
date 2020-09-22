#!/usr/bin/env bash

set -o errexit

BACKUP_MINIO_BUCKET_NAME=${BACKUP_MINIO_BUCKET_NAME:-gitlab}
GITLAB_BACKUP_RETENTION=${GITLAB_BACKUP_RETENTION:-30d0h0m}

function pushgateway {
    if [ -n "${PUSHGATEWAY_URL}" ]; then
		cat <<-EOF | curl --silent --show-error --data-binary @- ${PUSHGATEWAY_URL}/metrics/job/gitlab-backup-mirror/instance/sync > /dev/null
			# TYPE gbm_sync_failed gauge
			# HELP gbm_sync_failed Whether the snyc failed
			gbm_sync_failed $1
			EOF
    fi
}

function notify {
	pushgateway 1
	echo "ERROR: Unable to sync!"
}

trap notify ERR

mc config host add gitlab ${GITLAB_MINIO_URL} ${GITLAB_MINIO_ACCESSKEY} ${GITLAB_MINIO_SECRETKEY} --api S3v4

mc config host add backup ${BACKUP_MINIO_URL} ${BACKUP_MINIO_ACCESSKEY} ${BACKUP_MINIO_SECRETKEY} --api S3v4

mc mb --ignore-existing backup/${BACKUP_MINIO_BUCKET_NAME}

[[ -n $(mc ls gitlab/gitlab-backups) ]] && mc rm --force --recursive --dangerous --older-than ${GITLAB_BACKUP_RETENTION} gitlab/gitlab-backups

mc mirror gitlab/gitlab-backups backup/${BACKUP_MINIO_BUCKET_NAME} --remove

pushgateway 0
