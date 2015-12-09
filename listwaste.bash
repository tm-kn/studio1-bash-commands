#!/bin/bash
###############################################################################
#
# listwaste - lists a files in ~/.waste
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

waste_dir=$HOME/.waste

# Check if waste directory exists first
if [ ! -d $waste_dir ]
then
    echo 'The waste bin for this user has not been created yet.'
    exit 0
fi

# List all the files in the waste bin
echo '========== Files in the waste bin ('$waste_dir') =========='
ls -l $waste_dir

exit 0
