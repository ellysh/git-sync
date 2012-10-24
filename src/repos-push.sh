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

        $(is_diff_empty "$REPO_NAME") && continue

        echo "${bldgre}Project $PROJECT - git push $REPO_NAME master$(tput sgr0)"
        git push $REPO_NAME master
    done

    restore_directory
}

is_diff_empty()
{
    REPO_NAME="$1"

    if [ -z "$(git diff "$REPO_NAME"/master --raw 2>&1)" ]
    then
        return 0
    else
        return 1
    fi
}


for PROJECT in $PROJECTS
do
    repos_push "$PROJECT"
done
