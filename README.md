# ubuntu

This repository is for collecting the utils for ubuntu series.

# Installation

## udev
sudo usermod -aG plugdev $(whoami)
sudo cp --parents etc/udev/rules.d/51-android.rules /
sudo /etc/init.d/udev restart

## samba
sudo apt install samba
sudo cp --parents etc/samba/smb.conf /
sudo /etc/init.d/smbd restart
