FROM minio/mc:RELEASE.2023-09-13T23-08-58Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
