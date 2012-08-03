#!/bin/sh

# The global constants used in several scripts

CONFIG_DIR="/etc/git-sync"

if [ ! -d "$CONFIG_DIR" ]
then
    CONFIG_DIR="../conf"
fi


if [ -n "$1" ]
then
    # Data for the git-pull.sh and git-push.sh scripts
    PROJECTS_DIR="$1"
    PROJECTS="$(ls "$PROJECTS_DIR")"
    REMOTE_REPOS="origin"
else
    # FIXME: Read this data from config file
    PROJECTS_DIR="/srv/sync"
    PROJECTS=$(cat "$CONFIG_DIR/projects.conf")
    REMOTE_REPOS=$(cat "$CONFIG_DIR/repository.conf")
fi

# Variables for the ssh-keys.sh script
SSH_KEY_PATH="/home/ilya/.ssh"
SSH_KEYS=$(cat "$CONFIG_DIR/keys.conf")

# Variables for the local-projects.sh script
ORIGIN_REPO="git@svn2"

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgre=${txtbld}$(tput setaf 2) # green
bldwht=${txtbld}$(tput setaf 7) # white
