#!/bin/sh

# The global constants used in several scripts

PROJECTS="libplanar mxu11x0 planar-display planar-editor pui"
PROJECTS_DIR="/home/ilya/sync"

# This names are the same as hostnames with gitolite to sync
REMOTE_REPOS="git.st svn2"

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgre=${txtbld}$(tput setaf 2) #  green
bldwht=${txtbld}$(tput setaf 7) # white
