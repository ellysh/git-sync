#!/bin/sh

# The global constants used in several scripts

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
