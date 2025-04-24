### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::functions.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::misc.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZP::git

autoload -Uz compinit && compinit
zinit cdreplay -q

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
###

# Zoxide
eval "$(zoxide init zsh)"
##

# fzf
eval "$(fzf --zsh)"
##

# Starship
eval "$(starship init zsh)"
##

# NEOVIM
export EDITOR=nvim
export GIT_EDITOR=nvim
##

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
##

# DENO
export DENO_INSTALL="/Users/notlinux2/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
[ -s "~/.deno/env" ] && . "/home/defalse/.deno/env"
##


# Added by `rbenv init` on Tue Aug 20 01:01:48 PM +07 2024
[ -s "~/.Null/Aurs/rbenv/bin/rbenv" ] && eval "$(~/.Null/Aurs/rbenv/bin/rbenv init - --no-rehash zsh)"

export PATH="$HOME/development/flutter/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/defalse/.dart-cli-completion/zsh-config.zsh ]] && . /home/defalse/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar"


[ -f "/home/defalse/.ghcup/env" ] && . "/home/defalse/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/Users/notlinux2/.ghcup/env" ] && . "/Users/notlinux2/.ghcup/env" # ghcup-env

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.9/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

# Clean duplicated path
export PATH=$(echo $PATH | awk -v RS=: '!seen[$0]++ {printf("%s:", $0)}' | sed 's/:$//')
##
