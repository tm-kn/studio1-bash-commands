#!/bin/bash
###############################################################################
#
# emptywaste - empty all the files from ~/.waste
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

waste_dir=$HOME'/.waste'

# Check if waste directory exists first
if [ ! -d $waste_dir ]
then
    echo 'The waste bin for this user has not been created yet.'
    exit 0
fi

# Delete all the files and subdirectories in the $waste_dir
rm -rf $waste_dir/*

exit 0
