# docker-devenv

> Docker image for a simple disposable development environment container for
> testing purposes and other goodies

## Usage

```
docker run --rm -it sshow/devenv bash
```

When you exit that bash instance, everything that was is no more

## Build

Clone repo, make edits, build image

```
git clone <repo> && cd <repo name>
docker build -t sshow/devenv <repo name>
```

## Gotchas

- Using Node Version Manager (nvm) for installing selective Node.js version

## TODO

- Write a Makefile

### Resources

- http://stackoverflow.com/questions/25899912/install-nvm-in-docker#28390848
- https://github.com/creationix/nvm#install-script
