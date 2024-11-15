#!/usr/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install plttn/fish-eza
fisher install jorgebucaran/hydro
fisher install catppuccin/fish

set -U hydro_color_pwd green
set -U hydro_symbol_git_dirty " ⚬"
set -U EZA_STANDARD_OPTIONS --group --header --group-directories-first --icons

yes | fish_config theme save "Catppuccin Frappe"