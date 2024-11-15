#!/usr/bin/env fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher < /dev/null
fisher install PatrickF1/fzf.fish < /dev/null
fisher install plttn/fish-eza < /dev/null
fisher install jorgebucaran/hydro < /dev/null
fisher install catppuccin/fish < /dev/null
yes | fish_config theme save "Catppuccin Frappe"