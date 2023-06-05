FROM minio/mc:RELEASE.2023-05-30T22-41-38Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
