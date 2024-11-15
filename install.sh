#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf stow

stow fish

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && (fisher install jorgebucaran/fisher < /dev/null)'
echo "Fisher done"
fish -c 'fisher update < /dev/null'
# Set fish as default shell
FISH="$(which fish)"
CURRENT_USER="$(whoami)"

sudo chsh --shell "$FISH" "$CURRENT_USER"

exit 0