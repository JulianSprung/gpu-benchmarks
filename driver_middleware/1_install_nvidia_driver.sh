#Remove older Nvidia driver
sudo apt-get purge nvidia*

#Get Driver Version 384
sudo apt-get update
sudo apt-get install nvidia-384

#Reboot the system
sudo reboot