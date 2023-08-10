FROM minio/mc:RELEASE.2023-08-08T17-23-59Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
