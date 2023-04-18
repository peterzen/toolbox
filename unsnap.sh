#!/usr/bin/bash


# Based on https://onlinux.systems/guides/20220524_how-to-disable-and-remove-snap-on-ubuntu-2204

echo Disabling snap services
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service

echo Removing snaps
sudo snap remove firefox
sudo snap remove gnome-3-38-2004
sudo snap remove gtk-common-themes
sudo snap remove snap-store
sudo snap remove snapd-desktop-integration
sudo snap remove core20
sudo snap remove bare
sudo snap remove snapd

sudo apt autoremove --purge -y snapd

sudo rm -rf /var/cache/snapd/
rm -rf ~/snap

sudo tee /etc/apt/preferences.d/firefox-no-snap > /dev/null <<EOF
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1

EOF


sudo add-apt-repository -y ppa:mozillateam/ppa

sudo apt install -y firefox
