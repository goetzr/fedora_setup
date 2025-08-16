#! /bin/bash

# Install core development tools.
sudo dnf install -y @development-tools &> /dev/null

# Install neovim.
sudo dnf install -y neovim &> /dev/null
rm -rfd ~/.config/nvim &> /dev/null || true
mkdir ~/.config/nvim
stow -d ~/dotfiles nvim

# Install xclip to use as the clipboard provider for neovim when running X11.
if [[ -n $DISPLAY ]]; then
	# Running X11.
	sudo dnf install -y xclip
fi


# Install rust.
if [ ! -f ~/.cargo/bin/cargo ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
