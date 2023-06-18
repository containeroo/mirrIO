FROM minio/mc:RELEASE.2023-06-15T15-08-26Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
