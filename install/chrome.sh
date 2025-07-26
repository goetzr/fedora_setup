#! /bin/bash

sudo dnf install -y fedora-workstation-repositories &> /dev/null
sudo dnf config-manager setopt google-chrome.enabled=1 &> /dev/null
sudo dnf install -y google-chrome-stable &> /dev/null
