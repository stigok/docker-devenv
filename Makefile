#!/usr/bin/make -f

IMAGE_VERSION = 0.2

build:
	#docker build --tag sshow/devenv:$(IMAGE_VERSION) .
	docker build --build-arg NODE_VERSION=5.9.0 --build-arg NVM_VERSION=0.32.1 --tag sshow/devenv:$(IMAGE_VERSION) .
	docker tag sshow/devenv:$(IMAGE_VERSION) sshow/devenv:latest
