FROM minio/mc:RELEASE.2023-06-23T18-12-07Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
