FROM madeofpendletonwool/pinepods:latest
ENV PINEPODS_PORT=8080
EXPOSE 8080
WORKDIR /pinepods
# Sem o comentário no meio pra não dar erro de parse
RUN chmod -R 777 /pinepods
# Forçar o binário a rodar
ENTRYPOINT ["pinepods"]
