FROM ghcr.io/containeroo/alpine-toolbox:2.8.5

# renovate: datasource=github-tags depName=minio/mc extractVersion=^RELEASE\\.(?<major>\\d+)-(?<minor>\\d+)-(?<patch>\\d+)T.*Z(-(?<compatibility>.*))?$
ARG MINIO_VERSION=RELEASE.2023-10-14T01-57-03Z

RUN wget -O /work/mc https://dl.min.io/client/mc/release/linux-amd64/mc && \
  chmod +x /work/mc

ADD mirrio.sh /mirrio.sh

RUN chmod +x /mirrio.sh

ENTRYPOINT ["/mirrio.sh"]
