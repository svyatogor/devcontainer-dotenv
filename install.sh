#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf bat stow
sudo ln -s /usr/bin/batcat /usr/local/bin/bat

rm -rf ~/.config/fish
stow fish
stow bat
bat cache --build
./setup.fish