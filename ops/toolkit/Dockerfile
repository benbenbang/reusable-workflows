ARG IMAGE_VERSION=25.10
FROM ubuntu:${IMAGE_VERSION}

ARG JQ_VERSION=1.7.1-6ubuntu1
ENV JQ_VERSION=${JQ_VERSION}

ARG YQ_VERSION=3.4.3-2
ENV YQ_VERSION=${YQ_VERSION}

ARG PIPX_VERSION=1.7.1-1
ENV PIPX_VERSION=${PIPX_VERSION}

ARG GHCLI_VERSION=2.46.0-3
ENV GHCLI_VERSION=${GHCLI_VERSION}

ARG PRE_COMMIT_VERSION=4.2.0
ENV PRE_COMMIT_VERSION=${PRE_COMMIT_VERSION}

ARG UV_VERSION=0.8.0
ENV UV_VERSION=${UV_VERSION}

ARG POETRY_VERSION=2.1.3
ENV POETRY_VERSION=${POETRY_VERSION}

WORKDIR /workspace

ENV PATH=/root/.local/bin:${PATH}

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint
ADD profile.sh /profile.sh

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=linux

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    git \
    make \
    gcc \
    locales \
    build-essential \
    jq=${JQ_VERSION} \
    yq=${YQ_VERSION} \
    pipx=${PIPX_VERSION} && \
    # clean locals
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    # pipx install cli
    pipx ensurepath && \
    pipx ensurepath --global && \
    pipx install pre-commit==${PRE_COMMIT_VERSION} && \
    pipx install uv==${UV_VERSION} \
    poetry==${POETRY_VERSION} && \
    # mod
    chmod +x /usr/local/bin/docker-entrypoint && \
    # clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "docker-entrypoint" ]
