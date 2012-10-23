#!/bin/sh

# Script for pull origin repo for all projects

. ./configure.sh
. ./functions.sh

check_origin_diff()
{
    PROJECT="$1"

    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"

    echo "${bldwht}Project $PROJECT - git fetch origin$(tput sgr0)"
    git fetch origin

    if [ -n "$(git diff origin/master --raw)" ]
    then
        echo "${bldwht}Project $PROJECT - git pull origin master$(tput sgr0)"
        git pull origin master
    fi

    restore_directory
}


for CHECK_PROJECT in $PROJECTS
do
    check_origin_diff "$CHECK_PROJECT"
done
