#!/bin/sh

# Script for update subdirs git repositories


BIN_DIR="./src"

. "$BIN_DIR/configure.sh"
. "$BIN_DIR/functions.sh"

PROJECTS_DIR=$1
PROJECTS="$(ls "$PROJECTS_DIR")"

# FIXME: Check for dependecy application (git-core, etc...)

# FIXME: Implement sync for several branch (add branch list variable)

cd_safe $BIN_DIR

echo $(pwd)

./ssh-keys.sh

./origin-pull.sh

restore_directory
