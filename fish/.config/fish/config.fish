# Peristen fish history accross container restarts
if test -z "$XDG_DATA_HOME"
    set history_location ~/.local/share/fish/fish_history
else
    set history_location $XDG_DATA_HOME/fish/fish_history
end
if test -f $history_location
    mv $history_location "$history_location-old"
end
ln -s /dc/shellhistory/fish_history $history_location
sudo chown -R vscode $history_location

status is-interactive; and begin
    set BAT_THEME "Catppuccin Frappe"
    set BAT_PAGER 'less -R'
    set BAT_STYLE numbers

    # Abbreviations
    abbr --add -- gp 'git push'
    abbr --add -- gss 'git status -s'

    # Aliases
    # alias la 'eza -a'
    # alias less bat
    # alias ll 'eza -l'
    # alias lla 'eza -la'
    # alias ls eza
    # alias lt 'eza --tree'
    # alias vim nvim
    alias less=bat

    function __binpath_cwd -v PWD
        set -l node_modules_path "$PWD/node_modules/.bin"
        if test -e "$node_modules_path"
            set -g __node_binpath "$node_modules_path"
            set -x PATH $PATH $__node_binpath
        else
            set -q __node_binpath
            and set -l index (contains -i -- $__node_binpath $PATH)
            and set -e PATH[$index]
            and set -e __node_binpath
        end

        set -l rails_bin "./bin"
        if test -e "$rails_bin/rails"
            set -g __rails_binpath "$rails_bin"
            set -x PATH $PATH $__rails_binpath
        else
            set -q __rails_binpath
            and set -l index (contains -i -- $__rails_binpath $PATH)
            and set -e PATH[$index]
            and set -e __rails_binpath
        end
    end

    __binpath_cwd $PWD

    set EZA_STANDARD_OPTIONS --group --header --group-directories-first --icons
    set EDITOR code

    set fish_greeting # Disable greeting
    set fish_color_valid_path
    set hydro_symbol_git_dirty ' ⚬'
    set hydro_color_pwd green
    #set hydro_color_git yellow
    #set fish_prompt_pwd_dir_length 50 # maximum lenght of dir path
    fzf_configure_bindings
end
