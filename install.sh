#!/bin/bash

lock_root.sh

# update installed packages
sudo pacman -Syu --noconfirm

setup_base_utils.sh

setup_rust.sh

setup_paru.sh

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
    "nodejs"
    "npm"
)
paru -S --needed --noconfirm "${PACKAGES_TO_INSTALL[@]}"

setup_zsh.sh

