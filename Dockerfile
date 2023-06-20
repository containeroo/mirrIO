FROM minio/mc:RELEASE.2023-06-19T19-31-19Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
