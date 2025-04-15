#!/bin/bash

echo "Updating package lists..."
apt-get update

echo "Installing essential packages..."
apt-get install -y sudo curl wget git nano vim

echo "All done! Installed packages:"
dpkg -l | grep -E 'sudo|curl|wget|git|nano|vim'
