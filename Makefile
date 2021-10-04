.PHONY: bin/python bin/nodejs container-python container-nodejs

GIT_COMMIT_SHA="$(shell git rev-parse --short HEAD 2>/dev/null)"
REPO ?= tsidentity
PYTHON_IMG_NAME ?= tornjak-example-python
NODEJS_IMG_NAME ?= tornjak-example-nodejs
VERSION=$(shell cat version.txt)
# GO_FILES := $(shell find . -type f -name '*.go' -not -name '*_test.go' -not -path './vendor/*')

PYTHON_IMG := $(REPO)/$(PYTHON_IMG_NAME):$(GIT_COMMIT_SHA)
PYTHON_IMG_MUTABLE := $(REPO)/$(PYTHON_IMG_NAME):$(VERSION)
NODEJS_IMG := $(REPO)/$(NODEJS_IMG_NAME):$(GIT_COMMIT_SHA)
NODEJS_IMG_MUTABLE := $(REPO)/$(NODEJS_IMG_NAME):$(VERSION)

all: bin/python bin/nodejs container-python container-nodejs

bin/python:
	docker build --no-cache -t $(PYTHON_IMG) -f python/Dockerfile .
	docker tag $(PYTHON_IMG) $(PYTHON_IMG_MUTABLE)

bin/nodejs:
	docker build --no-cache -t $(NODEJS_IMG) -f nodejs/Dockerfile .
	docker tag $(NODEJS_IMG) $(NODEJS_IMG_MUTABLE)

container-python:
	docker push $(PYTHON_IMG)
	docker push $(PYTHON_IMG_MUTABLE)

container-nodejs:
	docker push $(NODEJS_IMG)
	docker push $(NODEJS_IMG_MUTABLE)

# vendor:
# 	go mod tidy
# 	go mod vendor
