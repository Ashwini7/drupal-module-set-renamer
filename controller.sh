#!/bin/bash

#Define current webserver
WEB_SERVER=$(uname -n)

#Define current time for use later on
NOW=$(date +"%m_%d_%Y-%H:%M:%S")

#Define script source dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Log file
LOG=/tmp/branch-switch-$NOW

#Define some colors for use later on
red='\e[0;31m'
ltblue='\e[1;34m'
green='\e[0;32m'
ltgreen='\e[1;32m'
NC='\e[00m'

echo ""
echo "Welcome to the"
echo -e "${ltblue}     _____________  _______   _______ _____________ ${NC}"
echo -e "${ltblue}     |    \_   ___ \ \      \ \______ \_     _____/ ${NC}"
echo -e "${ltblue}     |    /    \  \/ /   |   \|       _/|    __|_   ${NC}"
echo -e "${ltblue} /\__|    \     \___/    |    |    |   \|        \  ${NC}"
echo -e "${ltblue} \________|\______  \_______  |____|_  /_______  /  ${NC}feature clone sequence."
echo -e "${ltblue}                  \/        \/       \/        \/   ${NC}"
echo  "                 renaming a set of features, so just chill, till the next episode...  "
echo ""

#Read all CLI args passed and assign variables

OLD_NAME=$1
NEW_NAME=$2
NEW_SITE_NAME=$3
TARGET_DIR=$4

echo "Phase 1: Calling the python..."
echo ""
python -O rename.py $OLD_NAME $NEW_NAME $TARGET_DIR; 

echo ""
echo "Phase 2: Calling the cursed hammer..."
echo ""
cd $TARGET_DIR/../
if [ -d "$NEW_NAME" ]; then
	sh $SCRIPT_DIR/dirrenamer.sh $NEW_NAME/ $OLD_NAME $NEW_NAME "$NEW_SITE_NAME"
else
	echo -e "${red}[error] - could not find directory $NEW_NAME where it should be...${NC}"
fi
echo ""
echo "Sequence Complete."