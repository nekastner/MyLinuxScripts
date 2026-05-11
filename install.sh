#!/bin/bash

# install paru
sudo pacman -S -needed git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# update all installed packages
paru -Syu

# install additional packages
PACKAGES=(
    # hyprland
    "hyprland"
    "hyprlock"
    "hyprlauncher"
    "waybar"
    # base
    "librewolf-bin"
    "thunderbird"
    # programming
    "neovim"
    "code"
    "rider"
    "unityhub"
)
paru -S --needed --noconfirm "${PACKAGES[@]}"

# enable zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /usr/bin/zsh

# hints
cat << EOF
copy configs:

- zsh

- hyprland
- hyprlock
- waybar

- librewolf
- thunderbird

- neovim
- rider
EOF

