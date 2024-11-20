#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
ARCH=$(dpkg --print-architecture)

echo "Configuring devcontainer..."

# Check if running Debian
if [ -f /etc/debian_version ]; then
  echo "Debian detected"
  echo 'deb http://download.opensuse.org/repositories/shells:/fish/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish.list
  curl -fsSL https://download.opensuse.org/repositories/shells:fish/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish.gpg > /dev/null

  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

  BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
  wget "https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/bat_${BAT_VERSION#v}_${ARCH}.deb"
  sudo dpkg -i bat_${BAT_VERSION#v}_${ARCH}.deb
  rm bat_${BAT_VERSION#v}_${ARCH}.deb

  sudo apt update
  sudo apt-get install -y fish eza fzf stow
fi

# Check if running Ubuntu (which also has /etc/debian_version)
if [ -f /etc/lsb-release ]; then
  echo "Ubuntu detected"
  sudo apt-get install -y software-properties-common
  sudo apt-add-repository -y ppa:fish-shell/release-3

  sudo apt-get update
  sudo apt-get install -y fish eza fzf bat stow
fi

sudo ln -s /usr/bin/batcat /usr/local/bin/bat
rm -rf ~/.config/fish
stow fish
stow bat
bat cache --build
./setup.fish