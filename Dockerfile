FROM minio/mc:RELEASE.2023-07-11T23-30-44Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
