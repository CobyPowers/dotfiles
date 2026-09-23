#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

for config_path in $SCRIPT_DIR/config/*; do
  CONFIG_NAME=$(basename $config_path)
  cp -r $HOME/.config/$CONFIG_NAME $SCRIPT_DIR/config/$CONFIG_NAME
done

if pacman -Qs noctalia >/dev/null; then
  mkdir -p $SCRIPT_DIR/config/noctalia
  noctalia config export >$SCRIPT_DIR/config/noctalia/config.toml
fi

echo "ok"
