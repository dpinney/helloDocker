#!/bin/bash
# Build this staticsite app using its Dockerfile.
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $THISDIR -t staticsite
