FROM alpine:edge

LABEL maintainer Sebastian Sasu <sebastian.s@pocketplaylab.com>

ENV GOPATH /opt/tools

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
    && apk add --update --no-cache curl \
    build-base \
    bzr \
    git \
    mercurial \
    mariadb-client \
    postgresql-client \
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
    && apk upgrade \
    && rm -rf /var/cache/apk/*


RUN pip install cqlsh s3cmd \
    && go get github.com/rakyll/hey \
    && git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 && make && cp wrk /usr/bin/wrk2 \
    && rm -rf wrk2/
RUN apk del build-base openssl-dev py2-pip && rm -rf /var/cache/apk/*

WORKDIR /opt/tools

COPY wrk-test.lua $WORKDIR

CMD ["sh"]
