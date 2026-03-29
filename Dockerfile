FROM madeofpendletonwool/pinepods:latest

USER root

RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/nginx.conf && \
    mkdir -p /var/lib/nginx /var/log/nginx /tmp/pinepods /opt/pinepods && \
    chmod -R 777 /var/lib/nginx /var/log/nginx /var/www/html /tmp /opt/pinepods /etc/nginx

RUN chmod +x /startup.sh /usr/local/bin/pinepods-api /usr/local/bin/gpodder-api /usr/local/bin/pinepods-db-setup

RUN addgroup -g 10014 choreogroup && \
    adduser -D -u 10014 -G choreogroup choreouser && \
    chown -R 10014:10014 /var/www/html /var/log/nginx /var/lib/nginx /tmp /opt/pinepods

ENV PINEPODS_PORT=8080
ENV PORT=8080
ENV HOME=/tmp
ENV APP_ROOT=/pinepods

USER 10014

ENTRYPOINT ["bash", "/startup.sh"]
