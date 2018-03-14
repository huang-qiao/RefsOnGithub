#!/bin/bash

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OPENGROK_SRC=${BASE_DIR}/opengrok/src
REPO_LIST_DIR=${BASE_DIR}/source

cd ${REPO_LIST_DIR}
for f in *.yaml ; do
  vcs-import --input ${f} ${OPENGROK_SRC};
done

cd ${OPENGROK_SRC}
for d in */ ; do
  vcs-pull
done

cd ${BASE_DIR}
