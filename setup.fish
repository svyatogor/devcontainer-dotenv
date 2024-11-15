#!/usr/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install plttn/fish-eza
fisher install jorgebucaran/hydro
fisher install catppuccin/fish

yes | fish_config theme save "Catppuccin Frappe"


