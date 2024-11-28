#!/bin/bash

SCRIPTS="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
CONTENT_TYPE="img" $SCRIPTS/copy_dir.sh