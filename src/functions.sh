#!/bin/sh

# Common functions


# Temporary variable for current directory save
CURRENT_DIR_SAVE=""

cd_safe()
{
  # Save current directory
  CURRENT_DIR_SAVE=$(pwd)

  cd $1
}

restore_directory()
{
  # Restore saved by cd_safe() directory
  cd $CURRENT_DIR_SAVE
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

is_remote_repo_not_exist()
{
    REPO="$1"
    PROJECT="$2"

    if [ -z "$(echo "$(git ls-remote "$REPO$PROJECT.git")" 2>&1 | grep HEAD)" ]
    then
        return 0
    else
        return 1
    fi
}
