# Changelog

## [v2.1.1](https://github.com/containeroo/mirrIO/tree/v2.1.1) (2021-07-23)

[All Commits](https://github.com/containeroo/mirrIO/compare/v2.1.0...v2.1.1)

**other:**

- fix alpine version

## [v2.1.0](https://github.com/containeroo/mirrIO/tree/v2.1.0) (2021-04-03)

[All Commits](https://github.com/containeroo/mirrIO/compare/v2.0.3...v2.1.0)

**New features:**

- Add variable `ADDITIONAL_PARAMETERS`
- Add changelog

**Removed:**

- Remove multi arch docker image build since there is no mc binary available for other platforms

## [v2.0.3](https://github.com/containeroo/mirrIO/tree/v2.0.3) (2021-01-11)

[All Commits](https://github.com/containeroo/mirrIO/compare/v2.0.2...v2.0.3)

**New features:**

- multiarch image builds

## [v2.0.2](https://github.com/containeroo/mirrIO/tree/v2.0.2) (2021-01-07)

[All Commits](https://github.com/containeroo/mirrIO/compare/v2.0.1...v2.0.2)

**New features:**

- switch to github container registry

## [v2.0.1](https://github.com/containeroo/mirrIO/tree/v2.0.1) (2020-12-07)

[All Commits](https://github.com/containeroo/mirrIO/compare/v2.0.0...v2.0.1)

**New features:**

- Add max-time and retry to cURL command

## [v2.0.0](https://github.com/containeroo/mirrIO/tree/v2.0.0) (2020-10-29)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.8...v2.0.0)

**New features:**

- Rename gitlab-backup-mirror to mirrIO
- Rename all variables
- New Docker image
- Check if variables are set

## [v1.2.8](https://github.com/containeroo/mirrIO/tree/v1.2.8) (2020-09-30)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.7...v1.2.8)

**Bug fixes:**

- fix typo in metric help
- update examples

## [v1.2.7](https://github.com/containeroo/mirrIO/tree/v1.2.7) (2020-09-22)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.6...v1.2.7)

**Bug fixes:**

- fix hostname in readme

**New features:**

- add check if destination bucket already exists

## [v1.2.6](https://github.com/containeroo/mirrIO/tree/v1.2.6) (2020-09-22)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.5...v1.2.6)

**Bug fixes:**

- fix error if gitlab backups bucket is empty

## [v1.2.5](https://github.com/containeroo/mirrIO/tree/v1.2.5) (2020-09-13)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.4...v1.2.5)

**Bug fixes:**

- make cURL output silent
- fix indents

## [v1.2.4](https://github.com/containeroo/mirrIO/tree/v1.2.4) (2020-09-13)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.3...v1.2.4)

**Bug fixes:**

- make cURL output silent
- fix indents

## [v1.2.3](https://github.com/containeroo/mirrIO/tree/v1.2.3) (2020-09-10)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.2...v1.2.3)

**Bug fixes:**

- fix docker image

## [v1.2.2](https://github.com/containeroo/mirrIO/tree/v1.2.2) (2020-09-10)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.1...v1.2.2)

**Bug fixes:**

- fix docker image

## [v1.2.1](https://github.com/containeroo/mirrIO/tree/v1.2.1) (2020-09-10)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.2.0...v1.2.1)

**New features:**

- add bash to docker image
- switch shebang to bash

## [v1.2.0](https://github.com/containeroo/mirrIO/tree/v1.2.0) (2020-09-10)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.1.0...v1.2.0)

**New features:**

- add support for prometheus pushgateway
- add new optional variable PUSHGATEWAY_URL

## [v1.1.0](https://github.com/containeroo/mirrIO/tree/v1.1.0) (2020-09-03)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.0.1...v1.1.0)

**New features:**

- create bucket if not exists
- add backup minio gitlab backup bucket name variable
- add default values to BACKUP_MINIO_BUCKET_NAME and GITLAB_BACKUP_RETENTION

## [v1.0.1](https://github.com/containeroo/mirrIO/tree/v1.0.1) (2020-08-18)

[All Commits](https://github.com/containeroo/mirrIO/compare/v1.0.0...v1.0.1)

**New features:**

- add kubernetes manifest examples

## [v1.0.0](https://github.com/containeroo/mirrIO/tree/v1.0.0) (2020-08-05)

Initial release
