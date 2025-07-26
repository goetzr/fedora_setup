#! /bin/bash

sudo dnf install -y stow &> /dev/null

if [ ! -d ~/dotfiles ]; then
	git clone git@github.com:goetzr/dotfiles.git ~/dotfiles &> /dev/null
else
	# Enclose in parentheses to execute in a subshell.
	# This prevents the working directory for the current shell from changing.
	(cd ~/dotfiles && git pull &> /dev/null)
fi
