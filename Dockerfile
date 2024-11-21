FROM --platform=linux/amd64 rust AS builder
WORKDIR /app
COPY Cargo.lock Cargo.lock
COPY Cargo.toml Cargo.toml
COPY src src

RUN cargo build

ENTRYPOINT ["./target/release/skyfeed-query-engine"]
ENV SURREAL_URL_SQL="http://surreal:8000/sql"
