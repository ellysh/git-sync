#!/bin/sh

# Script to push origin repo to custom remote git repos in the subdirs
#
# Example: git-push.sh /home/user/Projects

CUSTOM_PROJECTS_DIR=0
SRC_DIR="/usr/share/git-sync"

if [ ! -d "$SRC_DIR" ]
then
    SRC_DIR="./src"
fi

. "$SRC_DIR/config_parser.sh"
. "$SRC_DIR/globals.sh"
. "$SRC_DIR/functions.sh"

PROJECTS_DIR="$1"

. "$SRC_DIR/ssh-keys.sh"

. "$SRC_DIR/repos-push.sh"
