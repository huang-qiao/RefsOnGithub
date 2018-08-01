#!/bin/bash

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OPENGROK_SRC=${BASE_DIR}/opengrok/src
OPENGROK_DATA=${BASE_DIR}/opengrok/data

docker run -it --rm \
  --privileged=true \
  --volume="${OPENGROK_SRC}:/var/opengrok/src" \
  --volume="${OPENGROK_DATA}:/var/opengrok/data" \
  -p 8080:8080 \
  opengrok
