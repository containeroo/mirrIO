FROM minio/mc:RELEASE.2023-10-14T01-57-03Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
