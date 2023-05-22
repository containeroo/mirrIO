FROM minio/mc:RELEASE.2023-05-18T16-59-00Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
