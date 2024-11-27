#!/bin/bash

ROOT="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")/.."
IMG_SOURCE="$ROOT/img"
DEFAULT_IMG_TARGET="$ROOT/../img"

# The ennvar IMG_TARGET can be used to set the target directory to copy images to
if [ -z ${IMG_TARGET+x} ]; then
  IMG_TARGET=$DEFAULT_IMG_TARGET
fi

mkdir -p $IMG_TARGET

for SOURCE_FILENAME in $IMG_SOURCE/*; do
    FILENAME=$(basename ${SOURCE_FILENAME})
    DEST_FILENAME="$IMG_TARGET/$FILENAME"
    if [ -f $DEST_FILENAME ]; then
        echo "ERROR: File $DEST_FILENAME already exists. This script will fail to ensure you don't inadvertently " \
             "overwrite a local version you're keeping for a reason. If it can be safely deleted, call the " \
             "'clear_images.sh' script or manually delete it." >&2
        exit 1
    else
        cp $SOURCE_FILENAME $DEST_FILENAME
    fi
done