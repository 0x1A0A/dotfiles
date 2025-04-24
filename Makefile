STOW := nvim zsh hyprland ghossty linux
STOW_NOFOLD := tmux

.PHONY: ${STOW} ${STOW_NOFOLD}

all: ${STOW} ${STOW_NOFOLD}
	@echo
	@echo "---Running in Dry run make sure everything look fine before install"

$(STOW):
	stow -Dnv $@

$(STOW_NOFOLD):
	stow --no-folding -Dnv $@
