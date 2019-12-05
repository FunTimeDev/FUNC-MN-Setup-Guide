#!/bin/bash

BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
MAG='\033[0;35m'


clear >$(tty)
echo -e "${RED}Are You Sure you want to completely delete your Function-Coin masternode?${NC}"
printf "\n"

while true; do
    read -p "Yes or No?" yn
    case $yn in
        [Yy]* ) cd; systemctl stop func.service; rm /etc/systemd/system/func.service; rm -rf .func; rm /usr/local/bin/func*; clear >$(tty); echo -e "${GRREN}Your masternode is now gone forever${NC}"; break;;
        [Nn]* ) exit;;
        * ) echo -e "${YELLOW}Please answer yes or no.${NC}";;
    esac
done
