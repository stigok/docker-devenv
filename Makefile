#!/usr/bin/make -f

IMAGE_VERSION = 0.2
BUILD_ARGS = --build-arg NODE_VERSION=6.9.1 --build-arg NVM_VERSION=0.32.1 --tag sshow/devenv:$(IMAGE_VERSION) .

build:
	docker build $(BUILD_ARGS)
	docker tag sshow/devenv:$(IMAGE_VERSION) sshow/devenv:latest

rebuild:
	docker build --no-cache $(BUILD_ARGS)
