#!/bin/sh

# Script for synchronisation git repositories


BIN_DIR="./"

. configure.sh

# FIXME: Check for dependecy application (git-core, etc...)

# FIXME: Implement sync for several branch (add branch list variable)

$BIN_DIR/ssh-keys.sh

$BIN_DIR/local-projects.sh

$BIN_DIR/remote-repos.sh

$BIN_DIR/origin-pull.sh

$BIN_DIR/repos-push.sh
