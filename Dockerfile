FROM minio/mc:RELEASE.2023-07-07T05-25-51Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
