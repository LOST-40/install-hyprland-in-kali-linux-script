# install-hyprland-in-kali-linux-script
install hyprland in kali linux script whit with config 

mad by LOST-40

How to Use:

git clone https://github.com/LOST-40/install-hyprland-in-kali-linux-script.git

cd install-hyprland-in-kali-linux-script

Make it executable:

chmod +x install_hyprland_kali.sh

Run it (with sudo if needed):

./install_hyprland_kali.sh

Post-Installation:
Reboot and select Hyprland from your display manager (SDDM/GDM/LightDM).

If issues arise, check:

bash

journalctl -u hyprland -b  # Logs for Hyprland
