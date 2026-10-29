#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))
CONTENT_TYPE=css $SCRIPTS/copy_dir.sh

DEFAULT_TARGET_DIR=$SCRIPTS/../../$CONTENT_TYPE

# The ennvar TARGET_DIR can be used to set the target directory to copy files to
if [ -z $TARGET_DIR ]; then
  TARGET_DIR=$DEFAULT_TARGET_DIR
fi

# If envvars are specific to set specific locations within the copied css files, update the new ones in-place

if [ ! -z $FONTS_LOC ]; then
    # Replace the fonts location in the common header and footer with the desired value
    LINE_TO_REPACE_ESCAPED='https:\/\/psdi-uk.github.io\/psdi-common-style\/fonts\/'
    ESCAPED_FONTS_LOC=$(printf '%s\n' "$FONTS_LOC" | sed -e 's/[\/&]/\\&/g')
    REPLACE_CMD_HEAD="sed -i -e 's/$LINE_TO_REPACE_ESCAPED/$ESCAPED_FONTS_LOC\//g' $TARGET_DIR"
    eval $REPLACE_CMD_HEAD/psdi-common-fonts.css
fi
