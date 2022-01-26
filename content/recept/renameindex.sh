#!/bin/sh
#ECHO=echo

#file=$1
for file in $(find . -name *.md); do 
#    echo $file
    directory=$(basename $file .md)
#    echo $directory
    image=$(grep bild $file| cut -d\" -f2)

#    echo $fil
#    echo $directory
#    echo $image
#    echo $targetimage

    $ECHO mv $file $directory/index.md
done
