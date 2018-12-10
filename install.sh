#!/bin/bash
DAEMON_ACCOUNT="TF2SERVERDAEMON"
SPACER="========================================"
echo "~~Root user check in progress~~"
if [ "$EUID" -ne 0 ]
  then
      echo "[ERROR] This installation script must be run with root privileges!"
      echo "Hint: type 'sudo ./install.sh'"
      echo "Exiting....."
  exit
fi
echo "Root privileges verified successfully!"
echo $SPACER
echo "Please enter your logs.tf API key:"
read LOGS_TF_API_KEY
echo "Please enter your demos.tf API key:"
read DEMOS_TF_API_KEY
echo $SPACER
echo "Installing dependencies..."
dpkg --add-architecture i386
apt update
apt -y --assume-yes install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libtcmalloc-minimal4:i386
echo "Finished installation of dependencies"
echo $SPACER
echo "Preparing for server installation"
echo "Generating daemon user account..."
adduser --system --shell '/bin/bash' --disabled-login $DAEMON_ACCOUNT
sudo -i -u $DAEMON_ACCOUNT bash << EOF
echo "Taking control of $DAEMON_ACCOUNT"
cd /home/$DAEMON_ACCOUNT
wget -O linuxgsm.sh https://linuxgsm.sh 
chmod +x linuxgsm.sh 
./linuxgsm.sh tf2server
./tf2server auto-install
echo "Base TF2 Server Installed Successfully!"
echo "Installing plugins..."
cd /home/$DAEMON_ACCOUNT
mkdir temp
cd temp
#Download Plugins from GitHub
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/sourcemod.tar.gz?raw=true" -O sourcemod.tar.gz
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/mmsource.tar.gz?raw=true" -O metamod.tar.gz
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/curl.zip?raw=true" -O curl_so.zip
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/TFTrue.zip?raw=true" -O TFTrue.zip
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/SOAP-TF2DM-master.zip?raw=true" -O SOAPDM.zip
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/MGEMod-master.zip?raw=true" -O MGE.zip
wget "https://raw.githubusercontent.com/tayyyTF/TF2ServerForNoobs/master/resources/metamod.vdf" -O metamod.vdf
#Extract Plugins
SOURCEMOD_FOLDER="sourcemod"
METAMOD_FOLDER="metamod"
SOAPDM_FOLDER="soapdm"
TFTRUE_FOLDER="tftrue"
MGE_FOLDER="mge"
CURL_FOLDER="curl_so"
mkdir $SOURCEMOD_FOLDER
mkdir $METAMOD_FOLDER
mkdir $SOAPDM_FOLDER
mkdir $TFTRUE_FOLDER
mkdir $MGE_FOLDER
mkdir $CURL_FOLDER
tar -xvzf sourcemod.tar.gz $SOURCEMOD_FOLDER/
tar -xvzf metamod.tar.gz $METAMOD_FOLDER/
unzip curl_so.zip -d $CURL_FOLDER/
unzip SOAPDM.zip -d $SOAPDM_FOLDER/
unzip MGE.zip -d $MGE_FOLDER/
unzip TFTrue.zip -d $TFTRUE_FOLDER/
cp -r $METAMOD_FOLDER/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp metamod.vdf /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r $SOURCEMOD_FOLDER/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp -r $TFTRUE_FOLDER/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp -r $MGE_FOLDER/maps/ /home/$DAEMON_ACCOUNT/serverfiles/tf/maps/
cp -r $MGE_FOLDER/addons/ /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r $SOAPDM_FOLDER/addons/ /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r $SOAPDM_FOLDER/cfg/ /home/$DAEMON_ACCOUNT/serverfiles/tf/cfg/
cp -r $CURL_FOLDER/extensions/ /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/sourcemod/extensions/
echo "Starting server..."
./tf2server start
#Enable Hourly Scheduled Update Check
(crontab -l; echo "0 * * * * /home/$DAEMON_ACCOUNT/tf2server update > /dev/null 2>&1") | crontab -
#Force Update Check At Boot
(crontab -l; echo "@reboot /home/$DAEMON_ACCOUNT/tf2server update > /dev/null 2>$1") | crontab -
#Force tf2server to start on boot
(crontab -l; echo "@reboot /home/$DAEMON_ACCOUNT/tf2server start > /dev/null 2>$1") | crontab -
EOF









