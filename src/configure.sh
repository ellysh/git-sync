#!/bin/sh

# The global constants used in several scripts

PROJECTS="step-controller libserial libatom libplanar mxu11x0 planar-display \
          planar-editor pui pui-keyboard pui-test mems-gyroscope simunit \
          uso-iso d2k-dask pci-dask pci429-4 libmysql-state kts25sm ece-0206 \
          libarinc arinc-test simscreen"
PROJECTS_DIR="~/sync"

# This names are the same as hostnames with gitolite to sync
REMOTE_REPOS="git.st"

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgre=${txtbld}$(tput setaf 2) #  green
bldwht=${txtbld}$(tput setaf 7) # white
