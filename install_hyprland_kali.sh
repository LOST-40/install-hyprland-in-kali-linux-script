#!/bin/bash

# Hyprland Installer for Kali Linux
# Fixed and upgraded with error handling, dependency checks, and safety measures.
# Usage: ./install_hyprland_kali.sh

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}Error: Do not run this script as root. Run as a normal user and use sudo when needed.${NC}"
    exit 1
fi

# Check if Kali Linux
if ! grep -q "Kali GNU/Linux" /etc/os-release; then
    echo -e "${RED}Error: This script is intended for Kali Linux only.${NC}"
    exit 1
fi

# Install missing dependencies
echo -e "${YELLOW}Checking dependencies...${NC}"
sudo apt update && sudo apt install -y git curl wget || {
    echo -e "${RED}Failed to install dependencies. Check your internet connection.${NC}"
    exit 1
}

# Clone or update the repository
REPO_DIR="Debian-Hyprland"
REPO_URL="https://github.com/JaKooLit/Debian-Hyprland.git"

if [ ! -d "$REPO_DIR" ]; then
    echo -e "${YELLOW}Cloning JaKooLit/Debian-Hyprland...${NC}"
    git clone "$REPO_URL" "$REPO_DIR" || {
        echo -e "${RED}Failed to clone the repository.${NC}"
        exit 1
    }
    cd "$REPO_DIR" || exit 1
else
    echo -e "${YELLOW}Updating existing repository...${NC}"
    cd "$REPO_DIR" || exit 1
    git pull || {
        echo -e "${RED}Failed to update the repository.${NC}"
        exit 1
    }
fi

# Verify install.sh exists
if [ ! -f "install.sh" ]; then
    echo -e "${RED}Error: install.sh not found in the repository.${NC}"
    exit 1
fi

# Run the installer
echo -e "${YELLOW}Starting Hyprland installation...${NC}"
chmod +x install.sh
./install.sh || {
    echo -e "${RED}Hyprland installation failed. Check logs above for errors.${NC}"
    exit 1
}

echo -e "${GREEN}Hyprland installed successfully! Reboot your system to apply changes.${NC}"
