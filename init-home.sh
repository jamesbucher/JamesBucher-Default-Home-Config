#!/bin/bash

GIT_URL="git://github.com/jamesbucher/JamesBucher-Default-Home-Config.git"
GIT_DIR="JamesBucher-Default-Home-Config"
TEMP_DIR=~/$$-temp
CONFIG_DIR="default"


while getopts g:f:t: opt
do
    case $opt in
	-g)    GIT_URL=$OPTARG
	       shift
	       ;;
	-c)    CONFIG_DIR=$OPTARG
	       shift
	       ;;
	-t)    TEMP_DIR=$OPTARG
	       shift
	       ;;
	esac
        shift
done

if `mkdir $TEMP_DIR`
then
    cd $TEMP_DIR
    #Download proper files
    git clone $GIT_URL
	cd $GIT_DIR
	if `ls $CONFIG_DIR`
	then
            #Fix Permissions on files
	    chmod -R 700 ./$CONFIG_DIR
            #Copy Files to default locations
	    cp -P -f -RT ./$CONFIG_DIR/ ~/
	else
	    printf "Error, Config: \"%s\" was not found.\n" $CONFIG_DIR
	fi
    #Clean up
    rm -rf $TEMP_DIR
else
    printf "Error, Could not create temp dir aborting\n"
fi
