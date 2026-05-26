cat << EOF >> sudo tee -a /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
[connection]
wifi.powersave = 2
EOF

sudo systemctl restart NetworkManager

