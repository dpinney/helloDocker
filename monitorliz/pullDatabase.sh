#!/bin/bash
# Stop, remove, build and start container.
NAME="monitorliz"
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker cp monitorliz:/usr/src/app/database.txt $THISDIR/databaseBackup.txt
# Rename to database.txt and run rebuild.sh and you'll put the database back in to the new container.
