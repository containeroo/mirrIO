#!/usr/bin/env sh

set -o errexit

bucketname=${BACKUP_MINIO_BUCKET_NAME:-gitlab}

mc config host add gitlab ${GITLAB_MINIO_URL} ${GITLAB_MINIO_ACCESSKEY} ${GITLAB_MINIO_SECRETKEY} --api S3v4

mc config host add backup ${BACKUP_MINIO_URL} ${BACKUP_MINIO_ACCESSKEY} ${BACKUP_MINIO_SECRETKEY} --api S3v4

mc mb --ignore-existing backup/gitlab

mc rm --force --recursive --dangerous --older-than ${GITLAB_BACKUP_RETENTION} gitlab/gitlab-backups

mc mirror gitlab/gitlab-backups backup/"${bucketname}" --remove
