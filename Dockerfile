FROM rust:1.75-slim-bookworm AS builder

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/madeofpendletonwool/pinepods.git .

RUN cargo build --release

FROM debian:bookworm-slim

ENV PINEPODS_PORT=8080
ENV DATA_DIR=/tmp/data
ENV HOME=/tmp
EXPOSE 8080

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/data /tmp/cache && \
    chmod -R 777 /tmp && \
    useradd -m -u 10014 choreouser

COPY --from=builder /app/target/release/pinepods /usr/local/bin/pinepods
RUN chmod +x /usr/local/bin/pinepods

USER 10014
WORKDIR /tmp

ENV PINEPODS_STORAGE_DIR=/tmp/data
ENV PINEPODS_CACHE_DIR=/tmp/cache

ENTRYPOINT ["/usr/local/bin/pinepods"]
