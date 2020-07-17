#!/bin/bash

TMP_FOLDER=$(mktemp -d)
CONFIG_FILE='func.conf'
CONFIGFOLDER='/root/.func'
COIN_DAEMON='funcd'
COIN_CLI='func-cli'
COIN_PATH='/usr/local/bin/'
COIN_TGZ='https://github.com/Function-Coin/FUNC/releases/download/v1.0.5/func-1.0.5-x86_64-linux-gnu.tar.gz'
COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
COIN_NAME='func'
BOOTSTRAP='http://164.68.112.107/func-bootstrap.zip'
BOOTSTRAP_FILE=$(echo $BOOTSTRAP | awk -F'/' '{print $NF}')



NODEIP=$(curl -s4 icanhazip.com)

BLUE='"\033[0;34m'
YELLOW='\033[0;33m' 
CYAN='\033[0;36m'
PURPLE='\033[0;35m' 
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
MAG='\033[0;35m'


function download_bootstrap() {
  rm -rf $CONFIGFOLDER/blocks >/dev/null 2>&1
  rm -rf $CONFIGFOLDER/chainstate >/dev/null 2>&1
  rm -rf $CONFIGFOLDER/sporks >/dev/null 2>&1
  rm -rf $CONFIGFOLDER/zerocoin >/dev/null 2>&1
  rm -rf $CONFIGFOLDER/database >/dev/null 2>&1
  rm $CONFIGFOLDER/*.pid >/dev/null 2>&1
  rm $CONFIGFOLDER/*.dat >/dev/null 2>&1
  rm $CONFIGFOLDER/*.log >/dev/null 2>&1
  wget -q $BOOTSTRAP
  unzip -oq $BOOTSTRAP_FILE -d $CONFIGFOLDER
  rm $BOOTSTRAP_FILE
 
  echo -e "${GREEN}Bootstrapped your $COIN_NAME masternode with success.${NC}"
 }
 
 download_bootstrap
