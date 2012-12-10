#!/bin/sh

# Script to read configs from files

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
