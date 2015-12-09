#!/bin/bash
#####################################################################
#
# chmx - a command that gives executable permission to a set of files
#
# Tomasz Knapik
# 03 November 2015
#####################################################################

if [ $# -lt 1 ]
then
    echo 'Usage '$0': Requires at least one parameter.'
    echo 'Parameters are name of files which will be set as executable.'
    exit
fi

for filename in "$@"
do
    # Check if file exists.
    if [ -e $filename ]
    then
        # Add execute permission to all users
        chmod a+x $filename
    else
        # Output an error message to the user
        echo $filename "does not exist."
    fi
done
