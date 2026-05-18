sudo pacman -S ufw
sudo systemctl enable ufw.service

sudo ufw default deny incoming
sudo ufw default allow outgoing

