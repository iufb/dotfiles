set fish_greeting ""
alias bd 'yarn start:dev'
alias ! 'history -1'
alias kn 'killall eslint_d prettierd node'
alias fd 'yarn dev'
alias ov 'NVIM_APPNAME=own.nvim nvim'
alias wg 'git remote ; git branch'
alias wq "wmctrl -r 'Alacritty' -b toggle,fullscreen"
alias bv 'NVIM_APPNAME=bitter nvim'
alias i 'sudo pacman -S '
alias ls "ls -p -G"
alias zj "zellij"
alias la "ls -A"
alias yy "yazi"
alias ll "ls -l"
alias lla "ll -A"
alias v nvim
alias tx tmux
# Git add/commit 
function ga
    if test (count $argv) -eq 0
        git add . ; git commit
    else 
        git add  $argv ; git commit
    end
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end
set NPM_PACKAGES "/home/iufb/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH  
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /home/iufb/.cargo/bin $PATH
set -gx PATH node_modules/.bin $PATH

set -x FLYCTL_INSTALL /home/iufb/.fly
set -x PATH $FLYCTL_INSTALL/bin:$PATH

#Android 
set -x ANDROID_HOME $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools
# Go 
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end
function runcpp
    eval "c++ -o $argv[1] $argv[1].cpp ; ./$argv[1]"
end

function mdir
    eval "mkdir $argv[1] ; cd $argv[1]"
end

zoxide init fish | source
