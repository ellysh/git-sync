#!/bin/sh

# Script for synchronisation git repositories

SRC_DIR="/usr/share/git-sync"
USR_BIN_DIR="/usr/bin"

if [ ! -d "$SRC_DIR" ]
then
    SRC_DIR="./src"
    USR_BIN_DIR="."
fi

. "$SRC_DIR/configure.sh"
. "$SRC_DIR/functions.sh"

# FIXME: Check for dependecy application (git-core, etc...)

# FIXME: Implement sync for several branch (add branch list variable)

[ -z "$@" ] && echo "$USAGE"

$(is_param_exist "h" "$@") && echo "$USAGE"

$(is_param_exist "i" "$@") && "$USR_BIN_DIR/git-init.sh" "$PROJECTS_DIR"

$(is_param_exist "l" "$@") && "$USR_BIN_DIR/git-pull.sh" "$PROJECTS_DIR"

$(is_param_exist "s" "$@") && "$USR_BIN_DIR/git-push.sh" "$PROJECTS_DIR"
