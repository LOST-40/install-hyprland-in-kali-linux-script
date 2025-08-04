#!/bin/bash

# This script installs Hyprland on Kali Linux using the JaKooLit/Debian-Hyprland script.
# It automates the process of cloning the repository and running the installation script.

# Ensure git is installed
if ! command -v git &> /dev/null
then
    echo "git could not be found, installing git..."
    sudo apt update
    sudo apt install -y git
fi

# Clone the JaKooLit/Debian-Hyprland repository
if [ ! -d "Debian-Hyprland" ]; then
    echo "Cloning JaKooLit/Debian-Hyprland repository..."
    git clone https://github.com/JaKooLit/Debian-Hyprland.git
    cd Debian-Hyprland
else
    echo "Debian-Hyprland repository already exists, updating..."
    cd Debian-Hyprland
    git pull
fi

# Make the install script executable and run it
echo "Running the Hyprland installation script..."
chmod +x install.sh
./install.sh

echo "Hyprland installation script finished. Please reboot your system."


