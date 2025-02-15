#!/bin/bash

echo "Updating Packages"
sudo pacman -Syu -y

echo "Downgrade Linux Kernel"
sudo pacman -U https://archive.archlinux.org/packages/l/linux/linux-6.1.1.arch1-1-x86_64.pkg.tar.zst
