FROM minio/mc:RELEASE.2023-06-06T13-48-56Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
