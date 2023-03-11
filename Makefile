.PHONY: all, bashall, bash_aliases, bash_local

all: help 
bashall: bash_aliases bash_local

help:
	@echo "install by make: \n \
	brew, tldr, vim, tmux \n"
	@echo "bash goodies: \n \
	bash_aliases, bash_local \n \
	or just bashall..."

test_confirmation:
	@read -p "Are you sure? [y/N] " ans && ans=$${ans:-N}; \
    if [ $${ans} = y ] || [ $${ans} = Y ]; then \
        echo "YES" ; \
    else \
        echo "NO" ; \
    fi
	@echo 'Next steps...'


brew:
	@if ! type -P brew; then \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "brew is already installed..."; \
	fi

tldr:
	@if ! type -P tldr; then \
		npm install -g tldr; fi

bash_aliases:
	@cp -i .bash_aliases ~/.bash_aliases

bash_local:
	@cp -i .bash_local ~/.bash_local

vim:
	@if [ -d ~/.vim ]; then rm -rf ~/.vim; fi
	@git clone https://github.com/gpakosz/.vim.git ~/.vim
	@ln -sf  ~/.vim/.vimrc ~/. 

tmux:
	@if [ -d ~/.tmux ]; then rm -rf ~/.tmux; fi
	@git clone https://github.com/gpakosz/.tmux.git ~/.tmux
	@ln -s -f ~/.tmux/.tmux.conf ~/. 
	@cp ~/.tmux/.tmux.conf.local ~/.
	@sed -i.bak '/set -g mouse on/s/#//' ~/.tmux.conf.local

	







