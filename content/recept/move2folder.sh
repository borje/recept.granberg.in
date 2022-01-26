#!/bin/sh
#ECHO=echo

#file=$1
for file in *.md; do 
    echo $file
    directory=$(basename $file .md)
    echo $directory
    image=$(grep bild $file| cut -d\" -f2)
    targetimage=$(basename $image)

#    echo $fil
#    echo $directory
#    echo $image
#    echo $targetimage

    $ECHO mkdir $directory
    $ECHO mv $file $directory
    if [ ! -z $image ]; then
        $ECHO mv ../../static/img/$image $directory/$targetimage
    fi
done