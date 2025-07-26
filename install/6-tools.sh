#! /bin/bash

sudo dnf install -y \
	wget curl unzip iputils \
	fd fzf ripgrep zoxide bat \
	fastfetch btop \
	man tldr less whois plocate \
	&> /dev/null

sudo dnf -y copr enable alternateved/eza &> /dev/null
sudo dnf install -y eza &> /dev/null
