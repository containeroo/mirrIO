FROM minio/mc:RELEASE.2023-05-04T18-10-16Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
