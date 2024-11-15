#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf stow

rm -rf ~/.config/fish
stow fish
./setup.fish