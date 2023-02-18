FROM alpine:3.17.2

# renovate: datasource=github-releases depName=minio/mc
ARG MC_VERSION=RELEASE.2023-02-16T19-20-11Z

RUN \
  apk add --no-cache ca-certificates bash curl && \
  curl https://dl.min.io/client/mc/release/linux-amd64/mc.${MC_VERSION} > /usr/bin/mc && \
  chmod +x /usr/bin/mc

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
