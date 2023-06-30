FROM minio/mc:RELEASE.2023-06-28T21-54-17Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
