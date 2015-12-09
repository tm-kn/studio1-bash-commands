#!/bin/bash
#########################################################
# emptywaste - empty all the files from the waste basket
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
#########################################################

waste_dir=$HOME'/.waste'

rm -rf $waste_dir/*
