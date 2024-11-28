#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))
CONTENT_TYPE=html $SCRIPTS/copy_dir.sh

DEFAULT_TARGET_DIR=$SCRIPTS/../../$CONTENT_TYPE

# The ennvar TARGET_DIR can be used to set the target directory to copy files to
if [ -z $TARGET_DIR ]; then
  TARGET_DIR=$DEFAULT_TARGET_DIR
fi

# If envvars are specific to set specific locations within the copied html files, update the new ones in-place

if [ ! -z $BRAND_LINK ]; then
    # Replace the brand link in the common header with the desired value
    ESCAPED_BRAND_LINK=$(printf '%s\n' "$BRAND_LINK" | sed -e 's/[\/&]/\\&/g')
    REPLACE_CMD="sed -i -e 's/\$REPLACEME_BRAND_LINK/$ESCAPED_BRAND_LINK/' $TARGET_DIR/psdi-common-header.html"
    eval $REPLACE_CMD
fi