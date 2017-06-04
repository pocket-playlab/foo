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
    && rm -rf /var/cache/apk/*


RUN pip install cqlsh s3cmd \
    && go get github.com/rakyll/hey \
    && git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 && make && cp wrk /usr/bin/wrk2 \
    && rm -rf wrk2/

WORKDIR /opt/tools

COPY wrk-test.lua $WORKDIR

CMD ["sh"]
