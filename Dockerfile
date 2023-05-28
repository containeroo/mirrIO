FROM minio/mc:RELEASE.2023-05-26T23-31-54Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
