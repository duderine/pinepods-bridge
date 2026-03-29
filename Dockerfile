FROM madeofpendletonwool/pinepods:latest

ENV PINEPODS_PORT=8080
EXPOSE 8080

USER root

RUN adduser --disabled-password --gecos "" choreouser && \
    mkdir -p /pinepods/config /pinepods/cache && \
    chown -R choreouser:choreouser /pinepods && \
    chmod -R 777 /pinepods

USER choreouser

WORKDIR /pinepods

ENTRYPOINT ["pinepods"]
