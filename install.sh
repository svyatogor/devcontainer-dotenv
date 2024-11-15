export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf
sudo usermod --shell /usr/bin/fish vscode

mkdir -p ~/.config/fish/conf.d

for file in ~/dotfiles/fish/conf.d/*; do
  ln -sf "$file" ~/.config/fish/conf.d/
done
