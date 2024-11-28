#!/bin/bash

SCRIPTS="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
CONTENT_TYPE="js" $SCRIPTS/copy_dir.sh