.PHONY: all say_hello 

all: say_hello

say_hello:
	@echo "Hello World"


brew:
	if ! type -P brew; then \
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh; \
	fi

