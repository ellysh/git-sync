#!/bin/sh

# Script for synchronisation git repositories


BIN_DIR="./src"

. "$BIN_DIR/configure.sh"
. "$BIN_DIR/functions.sh"

# FIXME: Check for dependecy application (git-core, etc...)

# FIXME: Implement sync for several branch (add branch list variable)

cd_safe $BIN_DIR


ssh-keys.sh

local-projects.sh

remote-repos.sh

origin-pull.sh

repos-push.sh


restore_directory
