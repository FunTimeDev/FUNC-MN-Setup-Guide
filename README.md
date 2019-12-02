# FUNC-MN-Setup-Guide

# FunTimeCoin
Shell script to install a FunTimeCoin Masternodes on a Linux server running Ubuntu 14.04, 16.04 or 18.04. Use it on your own risk.

***
## VPS MN Script
Installing Masternode on VPS
 1. Login to VPS using ssh root@(your IP)
 2. Input password
 3. Input the following and press enter
 ```
wget -N https://gist.githubusercontent.com/CryptoDev-Project/e3de04abd7c0cc748fda3ccb09ced424/raw/6dd4e7068815b0ecdea379c1754ea5abf63b9c7f/install_mn.sh
 ```
 4. Input the following and press enter
 ```
	bash install_mn.sh
```
 5. The script will now install the MN and once finished will ask you for a Genkey 
 6. In desktop wallet open **“debug console”**
 7. Type **“masternode genkey”**
 8. Go back to VPS and input genkey and press enter
 9. You will then need the genkey for step 8 below

***
## Desktop wallet setup
After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps for Windows Wallet
 1. Open the FunTimeCoin Desktop Wallet.
 2. Go to RECEIVE and create a New Address: **MN1**
 3. Send **20000 FUNC** to **MN1.**
 4. Wait for 15 confirmations.
 5. Go to **Tools -> "Debug console - Console"**
 6. Type the following command: **masternode outputs**
 7. Go to **Tools -> "Open Masternode Configuration File"**
 8. Add the following entry:
 ```
Alias Address Genkey TxHash Output_index
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Genkey**
* TxHash: **First value from Step 6**
* Output index: **Second value from Step 6**
 9. Save and close the file.
 10. Go to **Masternode Tab**. If your tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
 11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is unlocked.
 12. Right click the Masternode on the Masternode tab and click start alias or use the below command in **Debug Console** type:
 ```
startmasternode "alias" "0" "MN1"
```

***
## Usage:
```
func-cli getinfo
func-cli mnsync status
func-cli masternode status
```
Also, if you want to check/start/stop **FunTimeCoin** , run one of the following commands as root:
**Ubuntu 16.04:**
```
systemctl status func #To check the service is running.
systemctl start func #To start FunTimeCoin service.
systemctl stop func #To stop FunTimeCoin service.
systemctl is-enabled FunTimeCoin #To check whether FunTimeCoin service is enabled on boot or not.
```
**Ubuntu 14.04:**
```
/etc/init.d/func start #To start FunTimeCoin service
/etc/init.d/func stop #To stop FunTimeCoin service
/etc/init.d/func restart #To restart FunTimeCoin service
```
**Please Note:** Preferred version of Ubuntu is 16.04 as its most heavily tested but all should work. Dependencies can vary slightly for 18.04 though so choose 16.04 if possible
