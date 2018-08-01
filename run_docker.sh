#!/bin/bash

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OPENGROK_SRC=${BASE_DIR}/opengrok/src
OPENGROK_DATA=${BASE_DIR}/opengrok/data
OPENGROK_ETC=${BASE_DIR}/opengrok/etc
OPENGROK_LOG=${BASE_DIR}/opengrok/log

docker run -td --rm \
  --privileged=true \
  --volume="${OPENGROK_SRC}:/var/opengrok/src" \
  --volume="${OPENGROK_DATA}:/var/opengrok/data" \
  --volume="${OPENGROK_ETC}:/var/opengrok/etc" \
  --volume="${OPENGROK_LOG}:/var/opengrok/log" \
  -p 8080:8080 \
  opengrok
