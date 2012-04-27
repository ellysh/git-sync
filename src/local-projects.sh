#!/bin/sh

# Script for check and clone projects to local directory

. ./configure.sh

ORIGIN_REPO="git@svn2"


check_projects()
{
    EXIST_PROJECTS=$(ls $PROJECTS_DIR)

    for CHECK_PROJECT in $PROJECTS
    do
        if [ "$(echo $EXIST_PROJECTS | grep $CHECK_PROJECT )" = "" ]
        then
            echo "${bldwht}Project $CHECK_PROJECT - git clone$(tput sgr0)"
            clone_project "$CHECK_PROJECT"
        fi
    done
}

clone_project()
{
    CLONE_PROJECT="$1"

    [ "$CLONE_PROJECT" = "" ] && return 0

    git clone "$ORIGIN_REPO:$CLONE_PROJECT" "$PROJECTS_DIR/$CLONE_PROJECT"
}


check_projects
