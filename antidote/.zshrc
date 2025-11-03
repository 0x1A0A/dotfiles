# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
antidote_path=${ZDOTDIR:-~}/.antidote

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(${antidote_path}/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

# START Keybind
bindkey -e

for keymap in emacs vicmd; do
  for key in '^[[A' '^[OA'; do
    bindkey -M $keymap $key history-substring-search-up
  done
  for key in '^[[B' '^[OB'; do
    bindkey -M $keymap $key history-substring-search-down
  done
done

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
### END Keymap

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

export EDITOR=nvim
export GIT_EDITOR=nvim

### ENV
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="/home/defalse/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
[ -s "~/.deno/env" ] && . "/home/defalse/.deno/env"


# Added by `rbenv init` on Tue Aug 20 01:01:48 PM +07 2024
[ -s "~/.Null/Aurs/rbenv/bin/rbenv" ] && eval "$(~/.Null/Aurs/rbenv/bin/rbenv init - --no-rehash zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/development/flutter/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/defalse/.dart-cli-completion/zsh-config.zsh ]] && . /home/defalse/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar"

[ -f "/home/defalse/.ghcup/env" ] && . "/home/defalse/.ghcup/env" # ghcup-env

export PATH=$(echo $PATH | awk -v RS=: '!seen[$0]++ {printf("%s:", $0)}' | sed 's/:$//')
