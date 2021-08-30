#!/bin/bash

set -euo pipefail

## Variables

export DEV_IMAGE_NAME="visidata-dev"
export QA_IMAGE_NAME="visidata-qa"

### Main

if [ ! "${1:-}" ]; then 
  echo "Specify a subcommand."
  exit 1
fi

### Functions

function specify_commit () { 
  CURRENT_COMMIT=$(git --git-dir visidata/.git rev-parse HEAD | cut -c1-7)
  export CURRENT_COMMIT
}

### Main

case $1 in
  dev:build)
    specify_commit
    docker build . -f Dockerfile.dev -t "$DEV_IMAGE_NAME:$CURRENT_COMMIT"
    ;;
  dev:run)
    specify_commit
    docker run --mount type=bind,source="$PWD/visidata",destination=/home/vduser/visidata -w /home/vduser/visidata --rm -it "$DEV_IMAGE_NAME:$CURRENT_COMMIT" /bin/bash
    ;;
  qa:build)
    specify_commit
    docker build . -f Dockerfile.custom -t "$QA_IMAGE_NAME:$CURRENT_COMMIT"
    ;;
  qa:run)
    specify_commit
    docker run --rm -it "$QA_IMAGE_NAME:$CURRENT_COMMIT"
    ;;
  *)
    echo "$1 is not a valid command"
  ;;
esac
