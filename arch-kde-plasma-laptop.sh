#!/bin/bash

echo "Installing Yay"
cd ~
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installing Pacman Cleaner"
sudo pacman -S pacman-contrib
sudo systemctl enable paccache.timer

echo "Installing StarShip.rs"
curl -sS https://starship.rs/install.sh | sh
echo '# Starship' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo "Installing Firewall"
sudo pacman -S ufw
sudo ufw enable
sudo systemctl enable ufw
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload

echo "Enabling Bluetooth"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

echo "Installing Packages"
sudo pacman -S --noconfirm --needed gcc make ripgrep fd unzip neovim nodejs npm github-cli kdeconnect sof-firmware neofetch
yay -S firefox firefox-developer-edition

echo "Removing Unnecessary Packages"
sudo pacman -R konsole kate

echo "Cloning Dotfiles"
git clone https://github.com/bradcodecraft/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/bradcodecraft/kitty.git "${XDG_CONFIG_HOME:-$HOME/.config}"/kitty

echo "Make directories"
mkdir ~/Desktop/repositories
mv ~/Desktop/bash-scripts ~/Desktop/repositories
