# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.183.0/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.13, 3.12, 3.11, 3.10
ARG VARIANT="3.13"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

## Update Base Container
RUN apk update
RUN apk upgrade --available && sync

WORKDIR /tmp/

COPY . .

RUN bash ./setup.sh
