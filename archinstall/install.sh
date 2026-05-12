#!/bin/bash

# update installed packages
sudo pacman -Syu --noconfirm

# install paru
sudo pacman -S -needed git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# install additional packages
PACKAGES_TO_INSTALL=(
    # hyprland
    "hyprland"
    "hyprlock"
    "hyprlauncher"
    "waybar"
    # base
    "librewolf-bin"
    "thunderbird"
    "loupe"
    "elisa"
    "vlc"
    # ides
    "neovim"
    "code"
    "rider"
    "unityhub"
    # coding languages and managers
    "rustup"
    "nodejs"
    "npm"
)
paru -S --needed --noconfirm "${PACKAGES_TO_INSTALL[@]}"

# enable zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /usr/bin/zsh

# set rust default
rustup default stable

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

