#!/usr/bin/make -f

version = 0.2

build:
	docker build -t sshow/devenv:$(version) .
	docker tag sshow/devenv:$(version) sshow/devenv:latest
