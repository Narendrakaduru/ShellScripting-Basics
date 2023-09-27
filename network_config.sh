#! /bin/bash
#Purpose : To Configure the network and set ststic IP
#Version : v1
#Created Date :  Wed Sep 27 08:52:03 AM IST 2023
#Author : Narendra Kaduru
############### START ###############

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root or with sudo."
  exit 1
fi

read -rp "Please provide IP addresses : " IP
read -rp "Please provide Gateway addresses : " gateway

# Configure NetworkManager
echo "Configure NetworkManager"
sudo systemctl enable NetworkManager.service

# Create the Netplan YAML file with variables
cat <<EOF | sudo tee /etc/netplan/00-installer-config.yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s8:
      dhcp4: no
      addresses: [$IP/24]
      gateway4: $gateway
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF
sudo netplan try
sudo netplan apply
sudo systemctl restart NetworkManager
###############  END  ###############
