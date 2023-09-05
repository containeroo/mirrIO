FROM minio/mc:RELEASE.2023-09-02T21-28-03Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
