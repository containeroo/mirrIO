FROM minio/mc:RELEASE.2023-08-15T23-03-09Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
