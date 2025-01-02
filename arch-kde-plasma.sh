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

echo "Installing Packages"
sudo pacman -S --noconfirm --needed gcc make ripgrep fd unzip neovim nodejs npm kitty github-cli kdeconnect
yay -S firefox firefox-developer-edition

echo "Cloning Dotfiles"
git clone https://github.com/bradcodecraft/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/bradcodecraft/kitty.git "${XDG_CONFIG_HOME:-$HOME/.config}"/kitty

echo "Creating repositories"
cd ~/Desktop
mkdir repositories
