#! /bin/env bash

_CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# build the image on linux/amd64 and linux/arm64
docker buildx build --platform linux/amd64,linux/arm64 \
       --no-cache \
       -t ghcr.io/benbenbang/semantic-release:latest \
       -t ghcr.io/benbenbang/reusable-workflows/semantic-release:latest \
       --push \
       -f $_CURRENT_DIR/Dockerfile \
       $_CURRENT_DIR/.
