sudo tee -a /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf > /dev/null << "EOF"
[connection]
wifi.powersave = 2
EOF

sudo systemctl restart NetworkManager

