#!/bin/sh

# Script for check and clone projects to local directory

. ./configure.sh

check_projects()
{
    for CHECK_PROJECT in $PROJECTS
    do
        if [ ! -d "$PROJECTS_DIR/$CHECK_PROJECT" ]
        then
            clone_project "$CHECK_PROJECT"
        fi
    done
}

clone_project()
{
    CLONE_PROJECT="$1"

    [ "$CLONE_PROJECT" = "" ] && return 0

    echo "${bldwht}Project $CHECK_PROJECT - git clone$(tput sgr0)"
    git clone "$ORIGIN_REPO$CLONE_PROJECT.git" "$PROJECTS_DIR/$CLONE_PROJECT"
}


check_projects
