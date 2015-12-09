#!/bin/bash
waste_dir=$HOME'/.waste'

number=$(ls $waste_dir -1 | wc -l)

echo 'number of files in the waste bin: '$number
