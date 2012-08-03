#!/bin/sh

# Script to push origin for local git repositories in the subdirs
#
# Example: git-push.sh /home/user/Projects

BIN_DIR="./src"

. "$BIN_DIR/configure.sh"
. "$BIN_DIR/functions.sh"

PROJECTS_DIR="$1"

# FIXME: Check for dependecy application (git-core, etc...)

cd_safe $BIN_DIR

echo $(pwd)

./ssh-keys.sh

./repos-push.sh "$PROJECTS_DIR"

restore_directory
