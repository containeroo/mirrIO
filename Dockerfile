FROM alpine:latest

RUN \
    apk add --no-cache ca-certificates bash curl && \
    curl https://dl.min.io/client/mc/release/linux-amd64/mc > /usr/bin/mc && \
    chmod +x /usr/bin/mc

ADD gitlab-mirror.sh /gitlab-mirror.sh

RUN chmod +x /gitlab-mirror.sh

ENTRYPOINT ["/gitlab-mirror.sh"]
