FROM minio/mc:RELEASE.2023-07-18T21-05-38Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
