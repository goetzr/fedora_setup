#! /bin/bash

if ! lspci | grep -iP "vga.+nvidia" &> /dev/null; then
	# No NVIDIA GPU. Do nothing.
	return
fi

# Install the NVIDIA driver.
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda-libs &> /dev/null
sudo akmods --force --rebuild &> /dev/null

# Blacklist the nouveau and nova_core drivers.
#
# 1. Update GRUB.
#    NOTE: Running grubby updates the /etc/default/grub file with the new kernel arguments.
sudo grubby --update-kernel=ALL --args="rd.driver.blacklist=nouveau,nova_core modprobe.blacklist=nouveau,nova_core" &> /dev/null

# 2. Rebuild initramfs with blacklist file.
blacklist_file_path=/etc/modprobe.d/blacklist-nouveau.conf
if [ ! -f $blacklist_file_path ]; then
	echo "Rebuilding initramfs..."
	sudo tee "$blacklist_file_path" &> /dev/null <<-'EOF'
		blacklist nouveau
		blacklist nova_core
	EOF
	sudo dracut --force &> /dev/null
fi
