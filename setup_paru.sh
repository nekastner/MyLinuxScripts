#!/bin/bash

sudo pacman -S --needed --noconfirm git base-devel
setup_rust.sh

git clone https://aur.archlinux.org/paru.git

cd paru
makepkg -si

cd ..
rm -rf paru

