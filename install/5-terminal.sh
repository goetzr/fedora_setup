#! /bin/bash

# Install fonts.
fonts_dir_path=~/.local/share/fonts
if [ -d "$fonts_dir_path" ]; then
	rm -f "$fonts_dir_path/*" &> /dev/null || true
else 
	mkdir -p "$fonts_dir_path"
fi
stow -d ~/dotfiles fonts
fc-cache -fv &> /dev/null

# Install kitty terminal.
sudo dnf install -y kitty &> /dev/null
rm -frd ~/.config/kitty &> /dev/null || true
mkdir ~/.config/kitty
stow -d ~/dotfiles kitty

# Install starship prompt.
sudo dnf -y copr enable atim/starship &> /dev/null
sudo dnf install -y starship &> /dev/null
rm -f ~/.config/starship.toml &> /dev/null || true
stow -d ~/dotfiles starship

if ! grep starship ~/.bashrc &> /dev/null; then
	cat <<-'EOF' >> ~/.bashrc

	# Install starship prompt.
	eval "$(starship init bash)"
	EOF
fi
