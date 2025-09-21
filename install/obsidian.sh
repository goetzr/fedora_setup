#! /bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &> /dev/null
flatpak install flathub md.obsidian.Obsidian &> /dev/null
cat << EOF > ~/.local/share/applications/obsidian.desktop
[Desktop Entry]
Type=Application
Name=Obsidian
Exec=obsidian
Icon=obsidian
Terminal=false
EOF
