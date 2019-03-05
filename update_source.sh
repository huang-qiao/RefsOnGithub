#!/bin/bash

OPENGROK_SRC=./opengrok/src

find ${OPENGROK_SRC} -type d -name .git -exec git --git-dir={} --work-tree=$PWD/{}/.. pull --verbose \;

