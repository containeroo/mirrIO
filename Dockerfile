FROM minio/mc:RELEASE.2023-08-30T08-02-26Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
