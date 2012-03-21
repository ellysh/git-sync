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
