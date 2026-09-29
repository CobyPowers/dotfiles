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

if pacman -Qs flatpak >/dev/null; then
  cat $SCRIPT_DIR/install.flatpak | while read package; do
    flatpak install $package --noninteractive
  done
fi

# Apply dotfile configurations
$SCRIPT_DIR/bin/dotfiles_apply

# Reload hyprland and shell
$SCRIPT_DIR/bin/dotfiles_reload

echo "INFO: Dotfiles have been successfully installed"
