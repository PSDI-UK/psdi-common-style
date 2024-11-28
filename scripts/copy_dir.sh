#!/bin/bash

# This script copies the contents of one directory to another, checking if each contained file or directory exists
# first and throwing an error if so

DEFAULT_CONTENT_TYPE="img"

# The ennvar CONTENT_TYPE can be used to set the type of content to be copied. Valid values should match one of the
# directory names in this project (e.g. "img", "js", etc.)
if [ -z ${CONTENT_TYPE+x} ]; then
  CONTENT_TYPE=$DEFAULT_CONTENT_TYPE
fi

ROOT="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")/.."
SOURCE_DIR="$ROOT/$CONTENT_TYPE"
DEFAULT_TARGET_DIR="$ROOT/../$CONTENT_TYPE"

# The ennvar TARGET_DIR can be used to set the target directory to copy files to
if [ -z $TARGET_DIR ]; then
  TARGET_DIR=$DEFAULT_TARGET_DIR
fi

mkdir -p $TARGET_DIR

for SOURCE_FILENAME in $SOURCE_DIR/*; do
    FILENAME=$(basename ${SOURCE_FILENAME})
    DEST_FILENAME="$TARGET_DIR/$FILENAME"
    if [ -e $DEST_FILENAME ]; then
        echo "ERROR: File or directory $DEST_FILENAME already exists. This script will fail to ensure you don't " \
             "inadvertently  overwrite a local version you're keeping for a reason. If it can be safely deleted, " \
             "call the 'clear_images.sh' script or manually delete it." >&2
        exit 1
    else
        cp -r $SOURCE_FILENAME $DEST_FILENAME
    fi
done