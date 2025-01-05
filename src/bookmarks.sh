#! /bin/bash

# Path to directory with bookmarks
BASEDIR=/home/aicastell/Documentos/bookmarks
ARGV=$1

if [ -d $BASEDIR/$ARGV ]; then
    find $BASEDIR/$ARGV | grep txt | xargs cat | grep http
elif [ "$ARGV" == "basedir" ]; then
    echo $BASEDIR
elif [ ! -z $ARGV ]; then
    find $BASEDIR | grep txt | xargs cat | grep http | grep -i $ARGV
else
    find $BASEDIR | grep txt | xargs cat | grep http
fi

