# mirrIO

## About

- Mirror two MinIO buckets
- Delete files older than n days
- Send status to prometheus pushgateway

## Deployment

Please refer to the example deployment in the `deploy/` directory of this repository.

## Variables

mirrIO takes the following environment variables:

| Variable                | Description                                                               | Example                                                           |
| ----------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `JOB_NAME`              | Description of sync job (default: `mirrIO`)                               | `gitlab-sync`                                                     |
| `SOURCE_URL`            | URL for source MinIO                                                      | `http://source-minio.minio.svc.cluster.local:9000`                |
| `SOURCE_ACCESSKEY`      | Source MinIO accesskey                                                    | `abc`                                                             |
| `SOURCE_SECRETKEY`      | Source MinIO secretkey                                                    | `def`                                                             |
| `SOURCE_BUCKET`         | Source bucket name                                                        | `mybucket`                                                        |
| `DESTINATION_URL`       | URL for backup MinIO                                                      | `http://destination-minio.minio.svc.cluster.local:9000`           |
| `DESTINATION_ACCESSKEY` | Destination MinIO accesskey                                               | `ghi`                                                             |
| `DESTINATION_SECRETKEY` | Destination MinIO secretkey                                               | `jkl`                                                             |
| `DESTINATION_BUCKET`    | Destination bucket name                                                   | `mybucket`                                                        |
| `RETENTION`             | Delete files older than n days (default: `30d0h0m`)                       | `7d0h0m`                                                          |
| `PUSHGATEWAY_URL`       | Prometheus pushgateway URL (optional)                                     | `http://prometheus-pushgateway.monitoring.svc.cluster.local:9091` |
| `ADDITIONAL_PARAMETERS` | Add additional parameters to the `mc mirror` command (default: `--quiet`) | `--debug --force`                                                 |
