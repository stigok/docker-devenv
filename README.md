# docker-devenv

> Disposable development environment container for your disposable needs

## Usage

Download and run this image from Docker Hub

```
docker run --rm -it sshow/devenv:latest
```

Or clone/download the repo and build one yourself

```
make build
docker run -it devenv
```

## Gotchas

- Using `ubuntu:latest` as base
- Using Node Version Manager (nvm) for installing Node.js and NPM
- Username can be passed as `--build-arg USERNAME=user` to `docker build`

### Resources

- http://stackoverflow.com/questions/25899912/install-nvm-in-docker#28390848
- https://github.com/creationix/nvm#install-script
