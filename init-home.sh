#!/bin/bash

GIT_URL="git://github.com/jamesbucher/JamesBucher-Default-Home-Config.git"
GIT_DIR="JamesBucher-Default-Home-Config.git"
TEMP_DIR=$$-temp
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
    
    if `git clone $GIT_URL`
    then
	cd $GIT_DIR
	if `ls $CONFIG_DIR`
	then
            #Fix Permissions on files
	    chmod -R 500 ./$CONFIG_DIR
            #Copy Files to default locations
	    cp -RT ./$CONFIG_DIR/ ~/
	else
	    printf("Error, Config: \"%s\" was not found.\n", $CONFIG_DIR)
	fi
    else
	printf("Error, Could not access repository: %s\n", $GIT_URL)
    fi
    #Clean up
    cd ~/
    rm -rf ~/$$-temp
else
    printf("Error, Could not create temp dir aborting\n")
fi