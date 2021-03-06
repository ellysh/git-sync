#!/bin/sh

# Common functions

cd_safe()
{
  # Save current directory
  cd $1 > /dev/null
}

restore_directory()
{
  # Restore saved by cd_safe() directory
  cd - > /dev/null
}

get_repo_name()
{
    if [ "$(echo "$1" | grep '@')" != "" ]
    then
        # Remove repository user before '@' symbol
        WITHOUT_USER=$(echo "$1" | awk 'BEGIN{FS="@";OFS="";}{$1=""; print $0;}')
    else
        WITHOUT_USER="$1"
    fi

    # Remove repository path after ':' symbol
    RESULT=$(echo "$WITHOUT_USER" | awk 'BEGIN{FS=":";OFS="";}{$2=""; print $0}')

    echo "$RESULT"
}

is_param_exist()
{
    PARAM="$1"
    CMD="$2"

    if [ -z "$(echo "$CMD" | grep "$PARAM")" ]
    then
        return 1
    else
        return 0
    fi
}

is_remote_repo_exist()
{
    REPO="$1"
    PROJECT="$2"

    git ls-remote "$REPO$PROJECT.git"  > /dev/null 2>&1
    return $?
}
