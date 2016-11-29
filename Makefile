#!/usr/bin/make -f

IMAGE_VERSION = 0.2
IMAGE_NAME = devenv
BUILD_ARGS = --build-arg NODE_VERSION=6.9.1 --build-arg NVM_VERSION=0.32.1 --tag $(IMAGE_NAME):$(IMAGE_VERSION) .

build:
	docker build $(BUILD_ARGS)
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest

rebuild:
	docker build --no-cache $(BUILD_ARGS)
