# This Makefile is just for building the Docker image that builds the Chroma template
# Normal users of the template don't need to worry about this
DOCKERHUB_USERNAME = charlepm
CONTAINER_NAME = pandoc-latex-libertine
CONTAINER_VERSION = 0.2.0

build: Dockerfile
	docker build --tag $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME):$(CONTAINER_VERSION) .

push: build
	docker push $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME):$(CONTAINER_VERSION)
