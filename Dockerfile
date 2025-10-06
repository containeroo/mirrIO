FROM ghcr.io/containeroo/alpine-toolbox:3.0.0

ENV HOME=/work \
  MC_CONFIG_DIR=/work/.mc

# renovate: datasource=github-tags depName=minio/mc extractVersion=.*RELEASE\\.(?<major>\\d+)-(?<minor>\\d+)-(?<patch>\\d+)T.*Z(-(?<compatibility>.*))? versioning=loose
ARG MINIO_VERSION=RELEASE.2025-08-13T08-35-41Z

# App script
ADD mirrio.sh /work/mirrio.sh
USER root
RUN chmod 0755 /work/mirrio.sh

# Install mc (version-pinned)
ADD https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MINIO_VERSION} /usr/local/bin/mc
RUN chmod 0755 /usr/local/bin/mc

# OpenShift-friendly: group 0, g+w, setgid
RUN install -d -o 0 -g 0 -m 2775 /work/.mc \
  && ln -sfn /work/.mc /.mc

# Drop to non-root (your base convention)
ARG RUNTIME_USER=10001
ARG RUNTIME_GROUP=0
USER ${RUNTIME_USER}:${RUNTIME_GROUP}

CMD ["/usr/bin/catatonit", "--", "/work/mirrio.sh"]
