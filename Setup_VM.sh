#! /bin/bash
#Purpose : To initial setup VM and configure
#Version : v1
#Created Date :  Wed Sep 20 08:40:05 AM IST 2023
#Author : Narendra Kaduru
############### START ###############

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root or with sudo."
  exit 1
fi

read -rp "Please provide user name : " user
read -rp "Please provide IP addresses : " IP
read -rp "Please provide Gateway addresses : " gateway

# Update system
echo "Update system"
sudo apt update
sudo apt upgrade -y

# Set timzone to Kolkata
echo "Set timzone to Kolkata"
sudo timedatectl set-timezone Asia/Kolkata

# Extend LVM Volume
echo "Extend LVM Volume"
sudo pvresize /dev/sda3
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

# Install Dependency Packages
echo "Install Dependency Packages"
sudo apt-get install -y network-manager
sudo apt-get install -y openjdk-17-jdk

# Download maven from central repo
echo "Download maven from central repo"
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
sudo tar -xvzf apache-maven*.tar.gz
sudo rm -rf apache-maven*.tar.gz
sudo mv apache-maven* /opt/maven

# Update path in bashrc
echo "Update path in bashrc"
sudo echo 'JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
M2_HOME=/opt/maven
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin

export JAVA_HOME
export M2_HOME
export PATH' >> /root/.bashrc
source /root/.bashrc

# Add user to Sudoers file
echo "Add user to Sudoers file"
sudo echo '$user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enable Password Authentication
echo "Enable Password Authentication"
sudo echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

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
