#!/bin/bash

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OPENGROK_SRC=${BASE_DIR}/opengrok/src
OPENGROK_DATA=${BASE_DIR}/opengrok/data

docker run -td --rm \
  --privileged=true \
  --volume="${OPENGROK_SRC}:/src" \
  --volume="${OPENGROK_DATA}:/data" \
  -p 8080:8080 \
  opengrok
