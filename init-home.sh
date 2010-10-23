#!/bin/bash

#Copy over default files
#such as .bashrc, Awesome config, and default binaries
mkdir ~/$$-temp
cd $$-temp
git clone git://github.com/jamesbucher/JamesBucher-Default-Home-Config.git
#Fix Permissions on files
chmod -R 500 ./default
#Copy Files to default locations
cp -RT ./default/ ~/
#Clean up
cd ~/
rm -rf ~/$$-temp