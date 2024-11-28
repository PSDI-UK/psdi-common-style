#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))
CONTENT_TYPE=html $SCRIPTS/copy_dir.sh