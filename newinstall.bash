#!/bin/bash

DOWNLOAD_LOCATION=~/Downloads

# Default location
mkdir -p $DOWNLOAD_LOCATION
cd $DOWNLOAD_LOCATION

# Update anything and upgrade it
sudo apt update -y
sudo apt upgrade -y

# utility
sudo apt install numlockx -y

# drivers
# nvidia
# sudo apt install nvidia-driver-550 -y
sudo ubuntu-drivers install --recommended
sudo update-secureboot-policy --enroll-key

# gimp
sudo apt install gimp gimp-help-en -y

# steam
wget -O steam.deb "https://cdn.fastly.steamstatic.com/client/installer/steam.deb"
sudo apt install ./steam.deb -y
rm steam.deb

# discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb -y
rm discord.deb

# open-razer
sudo add-apt-repository ppa:openrazer/stable -y
sudo apt update -y
sudo apt install openrazer-meta -y

# polychromatic (gui razer control, uses above open-razer)
sudo add-apt-repository ppa:openrazer/stable -y
sudo add-apt-repository ppa:polychromatic/stable -y
sudo apt update -y
sudo apt install polychromatic -y
sudo gpasswd -a $USER plugdev

# obs
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install ffmpeg obs-studio -y

# vscode
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install ./vscode.deb -y
rm vscode.deb

# scrcpy
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                 gcc git pkg-config meson ninja-build libsdl2-dev \
                 libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-dev -y
rm -rf scrcpy
git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh
cd ..
rm -rf scrcpy
cd $DOWNLOAD_LOCATION

# Update anything and upgrade it
sudo apt update -y
sudo apt upgrade -y
