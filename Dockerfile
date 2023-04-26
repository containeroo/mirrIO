FROM minio/mc:RELEASE.2023-04-12T02-21-51Z

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
