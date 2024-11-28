#!/bin/bash

SCRIPTS=$(dirname -- $(readlink -f $BASH_SOURCE))
CONTENT_TYPE=js $SCRIPTS/clear_dir.sh