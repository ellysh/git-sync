#!/bin/sh

# Script for check remote git repos in the local projects

. ./configure.sh
. ./functions.sh


check_repos()
{
    PROJECT="$1"

    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"
    EXIST_REPOS="$(git remote)"
    restore_directory

    for CHECK_REPO in $REMOTE_REPOS
    do
        if [ "$(echo $EXIST_REPOS | grep $CHECK_REPO )" = "" ]
        then
            echo "${bldwht}Project $PROJECT - git remote add repo $CHECK_REPO$(tput sgr0)"
            add_repo "$CHECK_REPO" "$PROJECT"
        fi
    done
}

add_repo()
{
    ADD_REPO="$1"
    PROJECT="$2"

    [ "$ADD_REPO" = "" ] && return 0
    [ "$PROJECT" = "" ] && return 0

    cd_safe "$PROJECTS_DIR/$PROJECT"

    git remote add "$ADD_REPO" "git@$ADD_REPO:$PROJECT"

    restore_directory
}


for CHECK_PROJECT in $PROJECTS
do
    check_repos "$CHECK_PROJECT"
done
