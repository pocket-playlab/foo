# foo

[![Build Status](https://travis-ci.org/pocket-playlab/foo.svg?branch=master)](https://travis-ci.org/pocket-playlab/foo)

### Utility container reloaded


### Build foo

Clone the repository on your machine and build *foo*:

``git clone https://github.com/pocket-playlab/foo.git && cd foo``

``docker build -t foo .``

If you already have the git repository on your machine but it needs to be updated:

``cd foo && git pull``

``docker build --no-cache -t foo .``

### Usage

Self made:

``docker run -it --rm --name foo foo``

Pulled:

``docker run -it --rm --name foo pocketplaylab/foo``

Foo is based on [pocket-playlab/amumu](https://github.com/pocket-playlab/amumu) but uses [Alpine Linux docker image](https://hub.docker.com/_/alpine/). It has the same utilities and a few more: [wrk](https://github.com/wg/wrk) and [wrk2](https://github.com/giltene/wrk2)

Since this image is built using Alpine Linux, its size is considerably smaller than a build made with Ubuntu. Currently the uncompressed size of the image is ~700 MB and ~230 MB compressed (dockerhub)
