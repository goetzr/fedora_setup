#! /bin/bash

# Install core development tools.
sudo dnf install -y @development-tools &> /dev/null

# Install tmux.
sudo dnf install -y tmux

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

# Install the luarocks package manager for lua.
sudo dnf install -y luarocks

# Install rust.
if [ ! -f ~/.cargo/bin/cargo ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install ESP rust tools.
# Install perl (required to build OpenSSL for espup).
sudo dnf install -y perl
cargo install espup --locked
espup install
cargo install esp-generate
cargo install espflash
cargo install cargo-espflash
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh
