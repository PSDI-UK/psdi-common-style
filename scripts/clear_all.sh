#!/bin/bash

SCRIPTS="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

DEFAULT_TARGET_BASE_DIR=$SCRIPTS/../..

# The ennvar TARGET_BASE_DIR can be used to set the default directory which contains subdirs for each type
if [ -z $TARGET_BASE_DIR ]; then
  TARGET_BASE_DIR=$DEFAULT_TARGET_BASE_DIR
fi

TARGET_DIR=$TARGET_BASE_DIR/css $SCRIPTS/clear_css.sh
TARGET_DIR=$TARGET_BASE_DIR/img $SCRIPTS/clear_img.sh
TARGET_DIR=$TARGET_BASE_DIR/html $SCRIPTS/clear_html.sh
TARGET_DIR=$TARGET_BASE_DIR/js $SCRIPTS/clear_js.sh