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
            tmuxp load $layout
        end
    end


    # Aliases

    ## general
    alias ls="exa --long --group --icons --group-directories-first"
    alias vim=nvim
    alias sudo=doas
    alias lg=lazygit
    alias df="df -h"
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
    alias mkdir="mkdir -p"

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


    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/vc/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
