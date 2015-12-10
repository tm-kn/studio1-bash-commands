#!/bin/bash
###############################################################################
#
# addlocbintopath - adds local bin to $PATH
# It can add it temporarily or permanently to .bash_profile
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

local_bin=$HOME/bin
path_export="export PATH=\$PATH:"$local_bin


usage () {
    echo "Usage "$0": [perm/temp]"
    echo "Command adds your local bin ($local_bin) to \$PATH permanently or temporarily."
}

# Has to have one argument
if [ $# -ne 1 ]
then
    usage
    exit 1
fi

option=$1

if [ $option == 'perm' ] # Add permanently to $PATH
then
    # If bash profile doesn't exist or path export is not set in the profile
    if [ ! -e $HOME/.bash_profile ] ||  ! grep -Fxq "$path_export" ~/.bash_profile
    then
        # Add export declaration to ~/.bash_profile
        echo $path_export >>~/.bash_profile
        echo "Type command \"source ~/.bash_profile\" to activate \$PATH immediately."
    else
        echo "Your \$PATH in .bash_profile already contains "$local_bin
    fi
elif [ $option == 'temp' ] # Temporary add to $PATH
then
    # If path doesn't contain local bin
    if [[ $PATH != *$local_bin* ]]
    then
        # Display instructions what to type in terminal to add the command to the $PATH.
        echo "Use following command to add your local bin directory to the \$PATH:"
        echo $path_export
    else
        echo "Your \$PATH already contains "$local_bin
    fi
else # Invalid option
    usage
    exit 1
fi

exit 0
