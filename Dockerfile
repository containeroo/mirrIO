FROM minio/mc:RELEASE.2023-07-21T20-44-27Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
