#!/bin/sh

# Script to initialize local git repos in the subdirs
#
# Example: git-pull.sh /home/user/Projects

CUSTOM_PROJECTS_DIR=0
SRC_DIR="/usr/share/git-sync"

if [ ! -d "$SRC_DIR" ]
then
    SRC_DIR="./src"
fi

. "$SRC_DIR/configure.sh"
. "$SRC_DIR/functions.sh"

PROJECTS_DIR="$1"

# FIXME: Check for dependecy application (git-core, etc...)

cd_safe $SRC_DIR

echo $(pwd)

./ssh-keys.sh

./local-projects.sh

./remote-repos.sh

restore_directory
