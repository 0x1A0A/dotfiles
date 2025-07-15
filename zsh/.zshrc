# Initialize zsh completions (added by deno install script)
autoload -Uz compinit && compinit

export EDITOR=nvim
export GIT_EDITOR=nvim

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/plugins/git/git.plugin.zsh
source $ZSH/plugins/colored-man-pages/colored-man-pages.plugin.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/notlinux2/.zsh/completions:"* ]]; then export FPATH="/Users/notlinux2/.zsh/completions:$FPATH"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export DENO_INSTALL="/Users/notlinux2/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
[ -s "~/.deno/env" ] && . "/home/defalse/.deno/env"

# Added by `rbenv init` on Tue Aug 20 01:01:48 PM +07 2024
[ -s "~/.Null/Aurs/rbenv/bin/rbenv" ] && eval "$(~/.Null/Aurs/rbenv/bin/rbenv init - --no-rehash zsh)"

export PATH="$HOME/development/flutter/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/defalse/.dart-cli-completion/zsh-config.zsh ]] && . /home/defalse/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar"

export PATH=$(echo $PATH | awk -v RS=: '!seen[$0]++ {printf("%s:", $0)}' | sed 's/:$//')

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/Users/notlinux2/.ghcup/env" ] && . "/Users/notlinux2/.ghcup/env" # ghcup-env
