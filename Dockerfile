FROM alpine:edge

MAINTAINER Sebastian Sasu <sebastian.s@pocketplaylab.com>

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories

ENV GOPATH /

RUN apk update
RUN apk add curl \
    build-base \
    bzr \
    git \
    mercurial \
    mysql-client \
    postgresql-client \
    vim \
    redis \
    mongodb-tools \
    go \
    drill \
    htop \
    wrk \
    openssl-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/giltene/wrk2.git && cd wrk2 && make && cp wrk /usr/bin/wrk2 && cd / && rm -rf wrk2/
COPY wrk-test.lua .
RUN go get github.com/rakyll/boom

CMD ["sh"]
