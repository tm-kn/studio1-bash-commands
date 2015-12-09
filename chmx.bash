#!/bin/bash
################################################################################
#
# chmx - a command that gives executable permission to a set of files specified
#        in parametres.
#
# Tomasz Knapik
###############################################################################

usage () {
    echo 'Usage '$0': Requires at least one parameter.'
    echo 'Parameters are name of files which will be set as executable.'
}

# Check if number of arguments it's valid
if [ $# -lt 1 ]
then
    usage
    exit 1
fi

# Loop through arguments
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

exit 0
