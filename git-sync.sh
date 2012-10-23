#!/bin/sh

# Script for synchronisation git repositories

BIN_DIR="/usr/share/git-sync"

if [ ! -d "$BIN_DIR" ]
then
    BIN_DIR="./src"
fi

. "$BIN_DIR/configure.sh"
. "$BIN_DIR/functions.sh"

# FIXME: Check for dependecy application (git-core, etc...)

# FIXME: Implement sync for several branch (add branch list variable)

./git-init.sh "$PROJECTS_DIR"

./git-pull.sh "$PROJECTS_DIR"

./git-push.sh "$PROJECTS_DIR"
