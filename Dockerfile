FROM minio/mc:RELEASE.2023-08-18T21-57-55Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
