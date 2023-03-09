.PHONY: all

all: help 

help:
	@echo "install brew: brew"
	@echo "copy .vimrc:	vimrc"
	@echo "install vim-plug: vim-plug"
	@echo "install tldr: tldr"

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

vimrc:
	@cp -i .vimrc ~/.vimrc

bash_aliases:
	@cp -i .bash_aliases ~/.bash_aliases

tldr:
	@if ! type -P tldr; then \
		npm install -g tldr; fi

vim-plug:
	@if [ -f ~/.vim/autoload/plug.vim ]; then \
		echo "vim plug is already installed"; \
	else \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; fi


