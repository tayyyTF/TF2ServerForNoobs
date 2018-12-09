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
wget -O linuxgsm.sh https://linuxgsm.sh 
chmod +x linuxgsm.sh 
./linuxgsm.sh tf2server
./tf2server auto-install
EOF
#Force tf2server to start on boot
crontab -e
@reboot su - $DAEMON_ACCOUNT -c '/home/$DAEMON_ACCOUNT/tf2server start' > /dev/null 2>&1







