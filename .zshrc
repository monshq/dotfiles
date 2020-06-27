# zmodload zsh/zprof
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light 'sindresorhus/pure'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-syntax-highlighting'

# zinit snippet 'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker'

### End of Zinit's installer chunk


export EDITOR=nvim

export PKG_CONFIG_PATH='/usr/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/home/linuxbrew/.linuxbrew/lib/pkgconfig'


# alias ls='ls --color=always'
export CLICOLOR=1
alias la='ls -Alh'

alias vim='nvim'

alias be='bundle exec'
alias explico='bundle exec explico'
alias rspec='bundle exec rspec'

alias k='kubectl'

alias gaa='git add --all'
alias ga='git add'
alias gb='git branch -vv'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gd='git diff'
alias gss='git status -s'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'

alias zshconfig='vim ~/.zshrc && source ~/.zshrc'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

export PATH="$HOME/.rbenv/shims:$HOME/.local/bin:$PATH"

source $HOME/.asdf/asdf.sh
fpath=(~/.asdf/completions $fpath)

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
# zprof
