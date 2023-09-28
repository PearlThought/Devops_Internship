#!/bin/bash
# Ansible installation steps
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt install expect -y
# Define the username and password
username="jenkins"
password="teju1811"

# Check if the username already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Add the user with sudo privileges
useradd -m -s /bin/bash "$username"
usermod -aG sudo "$username"

# Set the password
echo "$username:$password" | chpasswd

echo "User '$username' has been created with sudo privileges."
# Changing password authentication to yes
SEARCH="PasswordAuthentication no"
REPLACE="PasswordAuthentication yes"
FILEPATH="/etc/ssh/sshd_config"
sudo sed -i "s;$SEARCH;$REPLACE;" $FILEPATH
# Restart the SSH service for change to take effect.
sudo service sshd restart

# Give the ansible user passwordless sudo
echo ''$username' ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo