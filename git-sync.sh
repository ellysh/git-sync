#!/bin/sh

# Script for synchronisation git repositories


BIN_DIR="./"


# FIXME: Check for dependecy application (git-core, etc...)

$BIN_DIR/ssh-keys.sh

$BIN_DIR/local-projects.sh
