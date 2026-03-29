FROM madeofpendletonwool/pinepods:latest
ENV PINEPODS_PORT=8080
EXPOSE 8080
WORKDIR /pinepods
# O Choreo precisa de permissão de escrita em tempo de execução
RUN chmod -R 777 /pinepods
CMD ["pinepods"]
