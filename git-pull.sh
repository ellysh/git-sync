#!/bin/sh

# Script to pull origin for local git repositories in the subdirs
#
# Example: git-pull.sh /home/user/Projects

BIN_DIR="/usr/share/git-sync"

if [ ! -d "$BIN_DIR" ]
then
    BIN_DIR="./src"
fi

. "$BIN_DIR/configure.sh"
. "$BIN_DIR/functions.sh"

PROJECTS_DIR="$1"

# FIXME: Check for dependecy application (git-core, etc...)

cd_safe $BIN_DIR

echo $(pwd)

./ssh-keys.sh

./origin-pull.sh "$PROJECTS_DIR"

restore_directory
