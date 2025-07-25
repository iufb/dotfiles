set fish_greeting ""
alias uchange 'sudo update-alternatives --config '
alias bd 'yarn start:dev'
alias ! 'history -1'
alias kn 'killall eslint_d prettierd node'
alias fd 'yarn dev'
alias dr docker
alias t tmux-sessionizer
alias ncn 'NVIM_APPNAME=ncn nvim'
alias g  git
alias wq "wmctrl -r 'Alacritty' -b toggle,fullscreen"
alias bv 'NVIM_APPNAME=bitter nvim'
alias i 'sudo apt install '
alias ls "exa -l -a"
alias zj "zellij"
alias la "ls -A"
alias yy "yazi"
alias ll "ls -l"
alias lla "ll -A"
alias v nvim
alias tx tmux
# Git add/commit 

function ga
  set files (git status --short | fzf --multi | awk '{print $2}')
    if test (count $files) -eq 0
        echo "No files selected."
        return 1
    end

    git add $files

    echo -n "Commit message: "
    read --prompt-str "📝 Commit message> " commit_msg
    if test -z "$commit_msg"
        echo "Commit message is empty. Aborting."
        return 1
    end

    git commit -m "$commit_msg"
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
set -gx TS_SEARCH_PATHS ~/Projects/
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
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx
#    end
#end
function runcpp
    eval "c++ -o $argv[1] $argv[1].cpp ; ./$argv[1]"
end

function mdir
    eval "mkdir $argv[1] ; cd $argv[1]"
end

zoxide init fish | source

nvm use latest > /dev/null

set -gx SDKMAN_DIR "$HOME/.sdkman"
if not contains "$SDKMAN_DIR/bin" $PATH
  set -gx PATH "$SDKMAN_DIR/bin" $PATH
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
