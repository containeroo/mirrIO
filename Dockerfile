FROM minio/mc:RELEASE.2023-09-07T22-48-55Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
