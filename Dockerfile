FROM madeofpendletonwool/pinepods:latest

# Porta que o Choreo vai expor
ENV PINEPODS_PORT=8080
EXPOSE 8080

USER root

# Garantir que as pastas de logs/cache existam e sejam graváveis por qualquer usuário
RUN mkdir -p /pinepods/config /pinepods/cache && \
    chmod -R 777 /pinepods

# O Choreo ignora o USER do Dockerfile e usa um aleatório, 
# mas manter o 1000 ajuda na compatibilidade base
USER 1000

# Variáveis que vamos injetar no painel do Choreo (mas deixo aqui de fallback)
ENV DATABASE_URL=""
ENV VALKEY_ENABLED=false

# Comando direto para o binário
CMD ["pinepods"]
