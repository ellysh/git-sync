#!/bin/sh

# Script for check and add the ssh keys for git servers

check_ssh_keys()
{
    SSH_AGENT_KEYS=$(ssh-add -l)

    for CHECK_KEY in $SSH_KEYS
    do
        if [ "$(echo $SSH_AGENT_KEYS | grep $CHECK_KEY )" = "" ]
        then
            add_ssh_key $CHECK_KEY
        fi
    done
}

add_ssh_key()
{
    ADD_KEY="$1"

    [ "$ADD_KEY" = "" ] && return 0

    ssh-add "$SSH_KEY_PATH/$ADD_KEY"
}


check_ssh_keys
