#!/bin/bash

GIT_REPO_URL="https://aur.archlinux.org/packettracer.git"
TEMP_PATH="$HOME/.install_cisco_packettracer_temp"
INSTALL_PATH="/usr/lib/packettracer"

mkdir -p "$TEMP_PATH"

# download
git clone "$GIT_REPO_URL" "$TEMP_PATH"
read -p "Download .deb package from 'https://www.netacad.com/resources/lab-downloads' into $TEMP_PATH. Press Enter to continue..." --

# build
makepkg -si -D "$TEMP_PATH"

# remove trash
rm rf "$TEMP_PATH"

# create executable app
sudo "$INSTALL_PATH/packettracer.AppImage" --appimage-extract
"$INSTALL_PATH/squashfs-root/AppRun" &

# copy icon
sudo cp /usr/lib/packettracer/squashfs-root/app.png /usr/share/icons/hicolor/48x48/apps/cisco-packettracer.png
# create desktop entry
echo "[Desktop Entry]
Name=Cisco PacketTracer
Exec=/usr/lib/packettracer/squashfs-root/AppRun
Icon=cisco-packettracer
Type=Application
Categories=Education;
Keywords=cisco;packettracer;" | sudo tee /usr/share/applications/cisco-packettracer.desktop > /dev/null

