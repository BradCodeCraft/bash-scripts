#!/bin/bash

echo "Navigating to Downloads folder"
cd ~/Downloads/ || exit

echo "Copying Firefox Developer Edition's tar file to /opt"
sudo cp -rp firefox*.tar.bz2 /opt

echo "Deleting Tar file"
sudo rm -rf firefox*.tar.bz2

echo "Navigating to /opt folder"
cd /opt/ || exit

echo "Untar Firefox Developer Edition's tar file"
sudo tar xjf firefox*.tar.bz2

echo "Deleting Tar file"
sudo rm -rf firefox*.tar.bz2

echo "Renaming Firefox Developer Edition folder"
sudo mv firefox firefox-developer-edition

echo "Change ownership of Firefox Developer Edition folder"
# shellcheck disable=SC2086
sudo chown -R $USER /opt/firefox-developer-edition

echo "Copy shortcut file"
sudo cp ~/Desktop/repositories/bash-scripts/firefox-developer-edition.desktop /usr/share/applications/

echo "Mark launcher trusted and executable"
sudo chmod +x /usr/share/applications/firefox-developer-edition.desktop
