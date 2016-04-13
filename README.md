# foo

### Utility container reloaded


### Build foo

Clone the repository on your machine and build *foo*:

``git clone git@github.com:pocket-playlab/foo.git && cd foo``

``docker build -t foo .``

### Usage

Self made:

``docker run -it --name foo foo``

Pulled:

``docker run -it --name foo pocketplaylab/foo``

Foo is based on [pocket-playlab/amumu](https://github.com/pocket-playlab/amumu) but uses [Alpine Linux docker image](https://hub.docker.com/_/alpine/)
