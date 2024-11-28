#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))
CONTENT_TYPE=css $SCRIPTS/copy_dir.sh