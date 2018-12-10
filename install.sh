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
apt -y --assume-yes install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq p7zip-full tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libtcmalloc-minimal4:i386
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
wget "https://github.com/tayyyTF/TF2ServerForNoobs/blob/master/resources/MGEMod-master.7z?raw=true" -O MGE.7z
wget "https://raw.githubusercontent.com/tayyyTF/TF2ServerForNoobs/master/resources/metamod.vdf" -O metamod.vdf
#Extract Plugins
mkdir sourcemod
mkdir metamod
mkdir curl_so
mkdir tftrue
mkdir soapdm
mkdir mge
tar -xvzf sourcemod.tar.gz -C sourcemod/
tar -xvzf metamod.tar.gz -C metamod/
7z x MGE.7z -omge/
unzip -o curl_so.zip -d curl_so/
unzip -o SOAPDM.zip -d soapdm/
unzip -o TFTrue.zip -d tftrue/
cp -r metamod/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp metamod.vdf /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r sourcemod/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp -r tftrue/ /home/$DAEMON_ACCOUNT/serverfiles/tf/
cp -r mge/maps/ /home/$DAEMON_ACCOUNT/serverfiles/tf/maps/
cp -r mge/addons/ /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r "soapdm/SOAP-TF2DM-master/addons/" /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/
cp -r "soapdm/SOAP-TF2DM-master/cfg/" /home/$DAEMON_ACCOUNT/serverfiles/tf/cfg/
cp -r curl_so/extensions/ /home/$DAEMON_ACCOUNT/serverfiles/tf/addons/sourcemod/extensions/
echo "Starting server..."
cd /home/$DAEMON_ACCOUNT/
./tf2server start
#Enable Hourly Scheduled Update Check
(crontab -l; echo "0 * * * * /home/$DAEMON_ACCOUNT/tf2server update > /dev/null 2>&1") | crontab -
#Force Update Check At Boot
(crontab -l; echo "@reboot /home/$DAEMON_ACCOUNT/tf2server update > /dev/null 2>$1") | crontab -
#Force tf2server to start on boot
(crontab -l; echo "@reboot /home/$DAEMON_ACCOUNT/tf2server start > /dev/null 2>$1") | crontab -
EOF









