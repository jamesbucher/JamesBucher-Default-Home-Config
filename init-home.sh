#!/bin/bash



GIT_URL="git://github.com/jamesbucher/JamesBucher-Default-Home-Config.git"
GIT_DIR="JamesBucher-Default-Home-Config.git"
#Default SubDir in the git root dir to copy files from
DEFAULT_DIR="default"
#If a specific config is specified then use it
CONFIG_DIR=${1:default}
TEMP_DIR=$$-temp

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
	    printf("Error, Config: \"%s\" was not found.\n");
	fi
    else
	printf("Error, Could not access repository\n")
    fi
    #Clean up
    cd ~/
    rm -rf ~/$$-temp
else
    printf("Error, Could not create temp dir aborting\n")
fi