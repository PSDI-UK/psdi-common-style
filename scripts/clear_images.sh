#!/bin/bash

ROOT="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")/.."
IMG_SOURCE="$ROOT/img"
DEFAULT_IMG_TARGET="$ROOT/../img"

# The ennvar IMG_TARGET can be used to set the target directory to clear images in
if [ -z ${IMG_TARGET+x} ]; then
  IMG_TARGET=$DEFAULT_IMG_TARGET
fi

mkdir -p $IMG_TARGET

for SOURCE_FILENAME in $IMG_SOURCE/*; do
    FILENAME=$(basename ${SOURCE_FILENAME})
    DEST_FILENAME="$IMG_TARGET/$FILENAME"
    if [ -f $DEST_FILENAME ]; then
        rm $DEST_FILENAME
    fi
done