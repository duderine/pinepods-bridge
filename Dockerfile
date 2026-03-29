FROM madeofpendletonwool/pinepods:latest

ENV PINEPODS_PORT=8080
ENV DATA_DIR=/tmp/data
ENV HOME=/tmp
EXPOSE 8080

USER root

RUN apk update && \
    apk add --no-cache openssl libssl3 libcrypto3 expat libexpat && \
    mkdir -p /tmp/data /tmp/cache && \
    chmod -R 777 /tmp && \
    adduser --disabled-password --gecos "" --uid 10014 choreouser

USER 10014

WORKDIR /pinepods

ENV PINEPODS_STORAGE_DIR=/tmp/data
ENV PINEPODS_CACHE_DIR=/tmp/cache

ENTRYPOINT ["pinepods"]
