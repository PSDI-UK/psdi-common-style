#!/bin/bash

SCRIPTS="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
CONTENT_TYPE="html" $SCRIPTS/clear_dir.sh