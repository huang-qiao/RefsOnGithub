#!/bin/bash

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OPENGROK_SRC=${BASE_DIR}/opengrok/src
OPENGROK_DATA=${BASE_DIR}/opengrok/data
OPENGROK_ETC=${BASE_DIR}/opengrok/etc

#docker run -it --rm \
docker run -tdv --rm \
  --privileged=true \
  --volume="${OPENGROK_SRC}:/opengrok/src" \
  --volume="${OPENGROK_DATA}:/opengrok/data" \
  --volume="${OPENGROK_ETC}:/var/opengrok/etc" \
  -p 8080:8080 \
  opengrok/docker:latest
