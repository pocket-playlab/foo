FROM alpine:edge

MAINTAINER Sebastian Sasu <sebastian.s@pocketplaylab.com>

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories

ENV GOPATH /

RUN apk add --update curl \
    build-base \
    bzr \
    git \
    mercurial \
    mariadb-client \
    postgresql-client \
    postgresql \
    vim \
    redis \
    mongodb-tools \
    go \
    drill \
    htop \
    wrk \
    openssl-dev \
    pssh \
    py2-pip \
    bash \
    nodejs \
    aws-cli \
    aws-cli-bash-completion \
    aws-cli-completer \
    && rm -rf /var/cache/apk/* \
    && rm -f /var/tmp/*

RUN pip install cqlsh s3cmd
RUN go get github.com/rakyll/hey
RUN git clone https://github.com/giltene/wrk2.git && cd wrk2 && make && cp wrk /usr/bin/wrk2 && cd / && rm -rf wrk2/

COPY wrk-test.lua .


CMD ["sh"]

