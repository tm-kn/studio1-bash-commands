#!/bin/bash
###############################################################################
#
# backupbin - creates a snapshot of your home directory bin folder
#             and copies it to ~/.binbackup. It allows you to browse versions
#             from specific date and time
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

binbackup_dir=$HOME/.binbackup
home_bin_dir=$HOME/bin
date=$(date +"%Y-%m-%d_%H-%M-%S")
current_backup_dir=$binbackup_dir/$date
number_of_files_to_backup=$(ls $home_bin_dir -1 | wc -l)


usage () {
    echo "Usage "$0": backups files from local bin to backup directory."
}


# When user enters some parameters, display usage information.
if [ $# -gt 0 ]
then
    usage
    exit 1
fi


# Check if local bin directory exists.
if [ ! -d $home_bin_dir ]
then
    echo $home_bin_dir" (backup source) does not exist."
    exit 1
fi


# If binbackup_dir does not exist, create one.
if [ ! -d $binbackup_dir ]
then
    mkdir $binbackup_dir
fi

# Check if there are any files inside binbackup
if [ $number_of_files_to_backup -eq 0 ]
then
    echo "There is nothing to backup inside "$home_bin_dir
    exit 0
fi

# Create a directory for a backup
mkdir $current_backup_dir

# Copy files over to the new folder
cp -R $home_bin_dir/* $current_backup_dir/

exit 0
