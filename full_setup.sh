#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

"$SCRIPT_DIR/lock_root.sh"

# update installed packages
sudo pacman -Syu --noconfirm

"$SCRIPT_DIR/setup_base_utils.sh"

"$SCRIPT_DIR/setup_rust.sh"

"$SCRIPT_DIR/setup_paru.sh"

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

"$SCRIPT_DIR/setup_zsh.sh"

