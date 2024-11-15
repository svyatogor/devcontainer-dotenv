export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf
sudo usermod --shell /usr/bin/fish vscode
~/dotfiles/setup.fish
exit 0