FROM minio/mc:RELEASE.2023-10-24T05-18-28Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
