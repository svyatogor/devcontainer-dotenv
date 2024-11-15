export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish eza fzf

mkdir -p ~/.config/fish/conf.d

for file in ~/dotfiles/fish/conf.d/*; do
  ln -sf "$file" ~/.config/fish/conf.d/
done

echo "Setting up fish"
echo "Installing fisher"
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
echo "Fisher installation complete"

echo "Installing PatrickF1/fzf.fish"
fish -c 'fisher install PatrickF1/fzf.fish'
echo "PatrickF1/fzf.fish installation complete"

echo "Installing plttn/fish-eza"
fish -c 'fisher install plttn/fish-eza'
echo "plttn/fish-eza installation complete"

echo "Installing jorgebucaran/hydro"
fish -c 'fisher install jorgebucaran/hydro'
echo "jorgebucaran/hydro installation complete"

echo "Installing catppuccin/fish"
fish -c 'fisher install catppuccin/fish'
echo "catppuccin/fish installation complete"

echo "Setting up fish done"