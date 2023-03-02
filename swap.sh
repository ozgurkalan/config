#!/bin/sh 
### increase swap size (esp. Conda needs, greedy bustard)
## https://net2.com/how-to-increase-swap-space-in-linux/
## finally check with the command: free -h


sudo fallocate -l 1G /swapfile 
sudo chmod 600 /swapfile 
sudo mkswap /swapfile 
sudo swapon /swapfile 
sudo cp /etc/fstab /etc/fstab.bak 
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
free -h
