#!/usr/bin/env bash

set -e

DOTFILES_DIR=$(cd -- "../$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

commit_usage() {
  echo "USAGE: ${BASH_SOURCE[0]} <msg>"
}

if [ $# -gt 0 ]; then
  git -C $DOTFILES_DIR add ./config
  git -C $DOTFILES_DIR commit -am "$*"
else
  commit_usage
  exit 1
fi
