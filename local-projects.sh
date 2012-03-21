#!/bin/sh

# Script for check and clone projects
# to local directory


PROJECTS="libplanar mxu11x0 planar-display planar-editor pui"
PROJECTS_DIR="/home/ilya/sync"
ORIGIN_REPO="git@github.com:ellysh"


check_projects()
{
    EXIST_PROJECTS=$(ls $PROJECTS_DIR)

    for CHECK_PROJECT in $PROJECTS
    do
        if [ "$(echo $EXIST_PROJECTS | grep $CHECK_PROJECT )" = "" ]
        then
            echo "Clone project $CHECK_PROJECT"
            clone_project "$CHECK_PROJECT"
        fi
    done
}

clone_project()
{
    CLONE_PROJECT="$1"

    [ "$CLONE_PROJECT" = "" ] && return 0

    git clone "$ORIGIN_REPO/$CLONE_PROJECT" "$PROJECTS_DIR/$CLONE_PROJECT"
}


check_projects
