# syntax=docker/dockerfile:1.3
# Etap 1: Budowanie aplikacji
FROM scratch AS builder
ADD alpine-minirootfs-3.19.1-x86_64.tar /
ARG VERSION
ARG AUTOR="Patryk Sowa"
ENV AUTOR = $AUTOR
RUN apk update && \
    apk upgrade && \
    apk add --no-cache nodejs=20.12.1-r0 \
    npm=10.2.5-r0 && \
    openssh-client \
    git && \
    rm -rf /etc/apk/cache


RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN mkdir -p /zadanie1

RUN --mount=type=ssh git clone git@github.com:Veximek/Zadanie1.git zadanie1 

WORKDIR /app

COPY src/package.json .

RUN npm install

COPY ./src .



# syntax=docker/dockerfile:1.3
# Etap 2: Uruchomienie aplikacji w kontenerze
FROM node:alpine

ARG VERSION

LABEL org.opencontainers.image.authors="Patryk Sowa"
LABEL org.opencontainers.image.version="$VERSION"

WORKDIR /app

COPY --from=builder /app .


ENV PORT=3000

EXPOSE ${PORT}
CMD ["node", "index.js"]
