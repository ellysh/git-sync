#!/bin/sh

# Script for pull origin repo for all projects

. configure.sh
. functions.sh


check_origin_diff()
{
    PROJECT="$1"

    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"
    git fetch origin

    if [ "$(git diff origin/master)" != "" ]
    then
        echo "Project $PROJECT - pull origin"
        git pull origin master
    fi

    restore_directory
}


for CHECK_PROJECT in $PROJECTS
do
    check_origin_diff "$CHECK_PROJECT"
done
