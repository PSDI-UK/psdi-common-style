#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))

DEFAULT_TARGET_BASE_DIR=$SCRIPTS/../..

# The ennvar TARGET_BASE_DIR can be used to set the default directory which will contain subdirs for each content type
if [ -z $TARGET_BASE_DIR ]; then
  TARGET_BASE_DIR=$DEFAULT_TARGET_BASE_DIR
fi

TARGET_DIR=$TARGET_BASE_DIR/css $SCRIPTS/copy_css.sh
TARGET_DIR=$TARGET_BASE_DIR/img $SCRIPTS/copy_img.sh
TARGET_DIR=$TARGET_BASE_DIR/html $SCRIPTS/copy_html.sh
TARGET_DIR=$TARGET_BASE_DIR/js $SCRIPTS/copy_js.sh