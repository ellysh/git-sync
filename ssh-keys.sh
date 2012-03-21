#!/bin/sh

# Script for check and add the ssh keys for
# remote git repositories


SSH_KEYS="github_rsa elly"
SSH_KEY_PATH="/home/ilya/.ssh"

check_ssh_keys()
{
    SSH_AGENT_KEYS=$(ssh-add -l)

    for CHECK_KEY in $SSH_KEYS
    do
        if [ "$(echo $SSH_AGENT_KEYS | grep $CHECK_KEY )" = "" ]
        then
            # FIXME: Add the missing key only here
            return 0
        fi
    done

    return 1
}

add_ssh_keys()
{
    for ADD_KEY in $SSH_KEYS
    do
        ssh-add "$SSH_KEY_PATH/$ADD_KEY"
    done
}


check_ssh_keys
if [ "$?" -eq "0" ]
then
    echo "Input ssh keys..."
    add_ssh_keys
fi
