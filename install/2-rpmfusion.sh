#! /bin/bash

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm &> /dev/null
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &> /dev/null
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1 &> /dev/null
sudo dnf update -y &> /dev/null
