#!/usr/bin/env bash

set -e

remove_if_exists() {
  if pacman -Qs $1 >/dev/null; then
    sudo pacman -Runs $1 --noconfirm
  fi
}

install_if_not_exists() {
  if ! pacman -Qs $1 >/dev/null; then
    sudo pacman -S $1 --noconfirm
  fi
}

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Create symlinks for config files
for config_path in $SCRIPT_DIR/config/*; do
  CONFIG_NAME=$(basename $config_path)

  # Wipe current configs if they exist, otherwise create directories
  if [ -d ~/.config/$CONFIG_NAME ]; then
    rm -rf ~/.config/$CONFIG_NAME/{*,.*}
  else
    mkdir -p ~/.config/$CONFIG_NAME
  fi

  for file_path in $config_path/*; do
    FILE_NAME=$(basename $file_path)
    ln -s ~/.local/share/dotfiles/config/$CONFIG_NAME/$FILE_NAME ~/.config/$CONFIG_NAME/$FILE_NAME
  done
done

sudo pacman -Syu --noconfirm

# Install & remove packages from system
cat $SCRIPT_DIR/remove.packages | while read package; do
  remove_if_exists $package
done

cat $SCRIPT_DIR/install.packages | while read package; do
  install_if_not_exists $package
done

set +e

# Reload hyprland and shell
noctalia msg templates-apply
sleep 0.5
hyprctl reload
