#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

remove_if_exists() {
  if pacman -Qs $1 >/dev/null; then
    paru -Runs $1 --noconfirm
  fi
}

install_if_not_exists() {
  if ! pacman -Qs $1 >/dev/null; then
    paru -S $1 --noconfirm
  fi
}

sudo pacman -Syu --noconfirm
sudo pacman -S paru --noconfirm

# Install & remove packages from system
cat $SCRIPT_DIR/remove.packages | while read package; do
  remove_if_exists $package
done

cat $SCRIPT_DIR/install.packages | while read package; do
  install_if_not_exists $package
done

# Apply dotfile configurations
$SCRIPT_DIR/bin/dotfiles_apply

# Reload hyprland and shell
echo "INFO: Applying noctalia templates"
noctalia msg templates-apply

# Ensure the templates have had enough time
# to generate before reloading hyprland
sleep 0.5

echo "INFO: Reloading hyprland configuration"
hyprctl reload

echo "INFO: Dotfiles have been successfully installed"
