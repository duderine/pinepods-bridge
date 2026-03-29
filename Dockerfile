FROM madeofpendletonwool/pinepods:latest
ENV PINEPODS_PORT=8080
EXPOSE 8080
WORKDIR /pinepods
RUN chmod -R 777 /pinepods
ENTRYPOINT ["pinepods"]
