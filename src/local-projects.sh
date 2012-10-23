#!/bin/sh

# Script for check and clone projects to local directory

. ./configure.sh
. ./functions.sh

check_projects()
{
    for PROJECT in $PROJECTS
    do
        if [ ! -d "$PROJECTS_DIR/$PROJECT" ]
        then
            clone_project "$PRIMARY_ORIGIN_REPO" "$PROJECT" && continue
            clone_project "$SECONDARY_ORIGIN_REPO" "$PROJECT"
        fi
    done
}

clone_project()
{
    REPO="$1"
    PROJECT="$2"

    [ "$PROJECT" = "" ] && return 1
    is_remote_repo_not_exist "$REPO" "$PROJECT" && return 1

    echo "${bldwht}Project $PROJECT - git clone$(tput sgr0)"
    echo "git clone "$REPO$PROJECT.git" "$PROJECTS_DIR/$PROJECT""
    git clone "$REPO$PROJECT.git" "$PROJECTS_DIR/$PROJECT"

    return 0
}


check_projects
