# bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
if status is-interactive
    and not set -q TMUX
    tmux new-session -A -s main
end

if status is-interactive
    set fish_greeting
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
    # Commands to run in interactive sessions can go here
    bass source ~/.profile

    function bind_bang
        switch (commandline -t)[-1]
            case "!"
                commandline -t $history[1]
                commandline -f repaint
            case "*"
                commandline -i !
        end
    end

    function bind_dollar
        switch (commandline -t)[-1]
            case "!"
                commandline -t ""
                commandline -f history-token-search-backward
            case "*"
                commandline -i '$'
        end
    end

    function zl
        set layout (fd -e yaml '.' "$HOME/.config/tmuxp/" -x echo {/.}| fzf)
        if test -n "$layout"
            NAME=(basename $PWD) tmuxp load $layout
        end
    end


    # Aliases

    ## general
    alias ls="exa --long --group --icons --group-directories-first"
    alias la="exa --all --long --group --icons --group-directories-first"
    alias vim=nvim
    alias svim='nvim -u ~/.config/nvim/stream.lua'
    alias sudo=doas
    alias lg=lazygit
    alias df="df -h"
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
    alias mkdir="mkdir -p"
    alias p="prevd"
    alias n="nextd"
    alias ac="aria2c -s16 -x16"

    ## git
    alias gcl="git clone"
    alias gco="git checkout"
    alias gcb="git checkout -b"
    alias gp="git push"
    alias gf="git fetch"
    alias gfp="git pull"

    # Keybinds
    bind -M insert \eo 'lfcd; commandline -f repaint'
    bind -M insert ! bind_bang
    bind -M insert '$' bind_dollar
    bind -M insert \cZ 'zl; commandline -f repaint'
    bind -M insert \cZ 'zl; commandline -f repaint'
    # bind -M insert \eI 'clear; commandline -f repaint'


    if test -z $TMUX
        # glow $HOME/my.md
        show.py
    end
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/"(whoami)"/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
