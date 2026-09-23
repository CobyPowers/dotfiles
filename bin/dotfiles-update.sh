#!/usr/bin/env bash

set -e

DOTFILES_DIR=$(cd -- "../$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
git -C $DOTFILES_DIR push
