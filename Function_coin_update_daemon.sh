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
COIN_PORT=12280
RPC_PORT=12281
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


 
 
function update_node() {
  echo -e "${GREEN}Downloading and updating your VPS $COIN_NAME Daemon${NC}"
  systemctl stop $COIN_NAME.service
  cd $TMP_FOLDER >/dev/null 2>&1
  wget -q $COIN_TGZ
  tar xvf $COIN_ZIP || unzip $COIN_ZIP >/dev/null 2>&1
  rm /usr/local/bin/$COIN_DAEMON >/dev/null 2>&1
  rm /usr/local/bin/$COIN_CLI >/dev/null 2>&1
  mv $(find ./ -mount -name $COIN_DAEMON) $COIN_PATH >/dev/null 2>&1
  mv $(find ./ -mount -name $COIN_CLI) $COIN_PATH >/dev/null 2>&1
  chmod +x $COIN_PATH$COIN_DAEMON >/dev/null 2>&1
  chmod +x $COIN_PATH$COIN_CLI >/dev/null 2>&1
  strip $COIN_PATH$COIN_DAEMON >/dev/null 2>&1
  strip $COIN_PATH$COIN_CLI >/dev/null 2>&1
  cd - >/dev/null 2>&1
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  systemctl start $COIN_NAME.service
  echo -e "${GREEN}Downloaded and updated your VPS $COIN_NAME with the latest Daemon${NC}"
}

update_node
