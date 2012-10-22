#!/bin/sh

# Script for push to remote repos

. ./configure.sh
. ./functions.sh

repos_push()
{
    PROJECT="$1"

    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"

    local CURRENT_REMOTE_REPOS="$(git remote | grep -v origin)"

    for REPO in $CURRENT_REMOTE_REPOS
    do
        REPO_NAME=$(get_repo_name $REPO)

        echo "${bldgre}Project $PROJECT - git push $REPO_NAME master$(tput sgr0)"
        git push $REPO_NAME master
    done

    restore_directory
}


for PROJECT in $PROJECTS
do
    repos_push "$PROJECT"
done
