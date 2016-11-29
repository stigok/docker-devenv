# docker-devenv

> Docker image for a simple disposable development environment container for
> testing purposes and other goodies

## Usage

Clone, build, run!
```
git clone https://github.com/stigok/docker-devenv
cd docker-devenv
docker build -t devenv .
docker run --rm -it devenv bash
```

When you exit that bash instance, everything that was is no more

## Gotchas

- Using latest Ubuntu image as base (16.04+)
- Using Node Version Manager (nvm) for handling Node.js version
- Username currently set to sshow (edit this in Dockerfile)

### Resources

- http://stackoverflow.com/questions/25899912/install-nvm-in-docker#28390848
- https://github.com/creationix/nvm#install-script
