#!/bin/bash

# lock root
sudo passwd -l root

# update installed packages
sudo pacman -Syu --noconfirm

# setup git
sudo pacman -S --noconfirm git

# setup base-devel
sudo pacman -S --noconfirm base-devel

# setup rust
sudo pacman -S --noconfirm rustup
rustup default stable

# setup paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# install additional packages
PACKAGES_TO_INSTALL=(
    # utils
    "git"
    "nano"
    "bat"
    "ripgrep"
    "sbctl"
    "cpupower"
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

# setup zsh
sudo pacman -S --noconfirm zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /usr/bin/zsh

