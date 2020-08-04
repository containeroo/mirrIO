# gitlab-backup-mirror

## About

- Mirror two MinIO buckets
- Delete files older than n days

Useful for GitLab backup mirroring between different MinIO instances.

## Variables

This image takes the following variables (all vars are required):

|Variable|Description|Example|
|--------|-----------|-------|
|`${GITLAB_MINIO_URL}`|URL for GitLab MinIO|`https://minio.local.example.com`|
|`${GITLAB_BACKUP_RETENTION}`|Delete backups older than ... days|`7d0h0m`|
|`${GITLAB_MINIO_ACCESSKEY}`|GitLab MinIO accesskey (from k8s secret)|`abc`|
|`${GITLAB_MINIO_SECRETKEY}`|GitLab MinIO secretkey (from k8s secret)|`def`|
|`${BACKUP_MINIO_URL}`|URL for backup MinIO|`https://minio-backup.local.example.com`|
|`${BACKUP_MINIO_ACCESSKEY}`|Backup MinIO accesskey (from k8s secret)|`ghi`|
|`${BACKUP_MINIO_SECRETKEY}`|Backup MinIO secretkey (from k8s secret)|`jkl`|
