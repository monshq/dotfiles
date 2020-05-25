if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# brew install terminal-notifier
# Install-Module -Name BurntToast
# or
# sudo apt install gnupg2 apt-transport-https
# wget -O - https://access.patrickwu.space/wslu/public.asc | sudo apt-key add -
# echo "deb https://access.patrickwu.space/wslu/debian buster main" | sudo tee -a /etc/apt/sources.list
# sudo apt update
# sudo apt install wslu

set EDITOR nvim

alias vim 'nvim'

alias be 'bundle exec'

alias gaa 'git add --all'
alias ga 'git add'
alias gb 'git branch -vv'
alias gc 'git commit -v'
alias gc! 'git commit -v --amend'
alias gca 'git commit -v -a'
alias gca! 'git commit -v -a --amend'
alias gd 'git diff'
alias gss 'git status -s'
alias gp 'git push'
alias gl 'git pull'
alias gco 'git checkout'
alias gcb 'git checkout -b'
alias gcp 'git cherry-pick'

alias fconfig 'vim ~/.config/fish/config.fish; and source ~/.config/fish/config.fish'
alias config 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function init-config
    git clone --bare git@github.com:monshq/dotfiles.git $HOME/.cfg;
    and config config --local status.showUntrackedFiles no
end

function backup-config
    mkdir -p ~/.config-backup
    config checkout 2>&1 | egrep "\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.config-backup/{}
end

set --universal fish_user_paths $fish_user_paths ~/.rbenv/shims

if test -e ~/.asdf/asdf.fish; source ~/.asdf/asdf.fish; end
