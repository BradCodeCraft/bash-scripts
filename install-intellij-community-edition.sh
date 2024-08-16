#!/bin/bash

echo "Navigating to Downloads folder"
cd ~/Downloads/ || exit

echo "Copying IntelliJ Community Edition's tar file to /opt"
sudo cp -rp ideaIC*.tar.gz /opt

echo "Deleting Tar file"
sudo rm -rf ideaIC*.tar.gz

echo "Navigating to /opt folder"
cd /opt/ || exit

echo "Untar IntelliJ Community Edition's tar file"
sudo tar xvf ideaIC*.tar.gz

echo "Deleting Tar file"
sudo rm -rf ideaIC*.tar.gz

echo "Renaming IntelliJ Community Edition folder"
sudo mv idea-* intellij-community-edition

echo "Change ownership of IntelliJ Community Edition folder"
# shellcheck disable=SC2086
sudo chown -R $USER /opt/intellij-community-edition

echo "Starting IntelliJ Community Edition bash file"
bash /opt/intellij-community-edition/bin/idea.sh
