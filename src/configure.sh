#!/bin/sh

# The global constants used in several scripts

CONFIG_DIR="/etc/git-sync"

if [ ! -d "$CONFIG_DIR" ]
then
    CONFIG_DIR="./conf"
    if [ ! -d "$CONFIG_DIR" ]
    then
        CONFIG_DIR="../conf"
    fi
fi

. "$CONFIG_DIR/git-sync.conf"

if [ "$CUSTOM_PROJECTS_DIR" = 1 ]
then
    # Data for the git-pull.sh and git-push.sh scripts
    PROJECTS_DIR="$1"
    PROJECTS="$(ls "$PROJECTS_DIR")"
    REMOTE_REPOS="origin"
else
    PROJECTS=$(cat "$CONFIG_DIR/projects.conf")
    REMOTE_REPOS=$(cat "$CONFIG_DIR/servers.conf")
fi

SSH_KEYS=$(cat "$CONFIG_DIR/keys.conf")

[ -n "$SSH_KEY_PATH" ] || SSH_KEY_PATH=$HOME/.ssh

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgre=${txtbld}$(tput setaf 2) # green
bldwht=${txtbld}$(tput setaf 7) # white

USAGE="Usage: git-sync.sh [OPTIONS]
Examples:
    git-sync.sh -ils    # perform all sync operations

Options:
    -i - init local repos
    -l - fetch and pull origin repos to local ones
    -s - push local repos to origin ones
    -h - print help"
