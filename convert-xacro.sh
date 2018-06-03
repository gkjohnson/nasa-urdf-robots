#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Provide <source> directory and then <target> directory as arguments"
    exit 1
fi

# case insensitive file iteration
shopt -s nocaseglob

# iterate over the xacro files in the directory
# and convert them to URDF files
for filepath in $1/*.xacro; do

    fullname=$(basename $filepath)
    name=${fullname%.*}
    targetpath=$2/$name.urdf

    echo $filepath ">" $targetpath

    rosrun xacro xacro -o "$targetpath" "$filepath"

done
