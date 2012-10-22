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
