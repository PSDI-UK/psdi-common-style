#!/bin/bash

# Source the configuration file to get settings in its envvars
ROOTDIR=$(dirname -- $(readlink -f $BASH_SOURCE))
source $ROOTDIR/fetch-common-style.conf

PACKAGE_FILENAME=$ROOTDIR/psdi-assets.tar.gz

# Check if the file already exists

if [ -f $PACKAGE_FILENAME ]; then
    echo "Assets are already available at $PACKAGE_FILENAME"
else
    # If ASSET_VER is not set, download the latest release
    if [ -z $TARGET_DIR ]; then
        # Code snippet courtesy of
        # https://geraldonit.com/2019/01/15/how-to-download-the-latest-github-repo-release-via-command-line/
        LOCATION=$(curl -s https://api.github.com/repos/psdi-uk/psdi-common-style/releases/latest \
        | grep "tag_name" \
        | awk '{print "https://github.com/psdi-uk/psdi-common-style/archive/" substr($2, 2, length($2)-3) ".tar.gz"}');
    else
        LOCATION="https://github.com/psdi-uk/psdi-common-style/archive/"$ASSET_VER".tar.gz"
    fi

    echo "Downloading assets from $LOCATION"
    curl -L -o $PACKAGE_FILENAME $LOCATION
fi



# Get the directory name within the archive
ASSET_SUBDIR=`tar tf $PACKAGE_FILENAME | head -n 1`
ASSET_DIR=$ROOTDIR/$ASSET_SUBDIR

echo "Extracting assets to $ASSET_DIR"
cd $ROOTDIR
tar xf $PACKAGE_FILENAME

if [ "$FETCH_ONLY" = "true" ]; then
    echo "FETCH_ONLY is set to 'true', so assets won't be copied. They're available in the following directory:"
    echo $ASSET_DIR
else
    echo "Copying assets to configured locations"
    $ASSET_DIR/scripts/copy_all.sh
fi