#!/bin/sh

# Script for push to remote repos

. ./configure.sh
. ./functions.sh


repos_push()
{
    PROJECT="$1"

    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"

    for REPO in $REMOTE_REPOS
    do
        echo "${bldgre}Project $PROJECT - git push $REPO master$(tput sgr0)"
        git push $REPO master
    done

    restore_directory
}


for PROJECT in $PROJECTS
do
    repos_push "$PROJECT"
done
