FROM minio/mc:RELEASE.2023-08-01T23-30-57Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
