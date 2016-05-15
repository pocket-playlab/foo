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
    && rm -rf /var/cache/apk/*

RUN go get github.com/rakyll/boom

CMD ["sh"]
