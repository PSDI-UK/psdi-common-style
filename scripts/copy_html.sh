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
    LINE_TO_REPLACE_LHS='<a class="navbar__brand" href="' # Everything before the default link
    LINE_TO_REPLACE_LINK='\.\/' # The default link, escaped for regex input
    LINE_TO_REPLACE_RHS='">' # Everything after the default link
    LINE_TO_REPLACE_ESCAPED='('$LINE_TO_REPLACE_LHS')'$LINE_TO_REPLACE_LINK'('$LINE_TO_REPLACE_RHS')'

    # Replace the brand link in the common header with the desired value
    ESCAPED_BRAND_LINK=$(printf '%s\n' "$BRAND_LINK" | sed -e 's/[\/&]/\\&/g')
    REPLACE_CMD="sed -i -E 's/$LINE_TO_REPLACE_ESCAPED/\1$ESCAPED_BRAND_LINK\2/' $TARGET_DIR/psdi-common-header.html"
    eval $REPLACE_CMD
fi

if [ ! -z $HEADER_LINKS_SOURCE ]; then
    # Replace the header links stub in the common header with the desired value
    ESCAPED_HEADER_LINKS=$(printf '%s\n' "`cat $HEADER_LINKS_SOURCE`" | sed -e 's/[\/&]/\\&/g')
    REPLACE_CMD="sed -i -e 's/\$REPLACEME_HEADER_LINKS/$ESCAPED_HEADER_LINKS/' $TARGET_DIR/psdi-common-header.html"
    eval $REPLACE_CMD
fi

if [ ! -z $IMG_LOC ]; then
    # Replace the image location stub in the common header with the desired value
    ESCAPED_IMG_LOC=$(printf '%s\n' "$IMG_LOC" | sed -e 's/[\/&]/\\&/g')
    REPLACE_CMD="sed -i -e 's/\$REPLACEME_IMG_LOC/$ESCAPED_IMG_LOC/g' $TARGET_DIR/psdi-common-header.html"
    eval $REPLACE_CMD
fi