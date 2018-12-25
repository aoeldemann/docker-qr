#!/bin/bash

function error {
  echo "ERROR: $1"
  exit -1
}

if [ -z "$1" ]; then
  error "argument must be either 'encode' or 'decode'"
fi

if [ "$1" == "encode" ]; then
  echo ${@:2}
  /usr/bin/qrencode --output /data/out.png "${@:2}"
elif [ "$1" == "decode" ]; then
  /usr/bin/zbarimg "/data/${@:2}" | head -n 1 | sed -e 's/^QR-Code://'
else
  error "argument must be either 'encode' or 'decode'"
fi
