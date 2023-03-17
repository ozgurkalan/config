#!/bin/bash

# bash and vim file edit
alias brc="vim ~/.bashrc"
alias bal="vim ~/.bash_aliases"
alias vrc="vim ~/.vimrc"

if command -v python &> /dev/null; then
# Python 2 is installed, create alias for python command
    alias py=python 
else command -v python3 &> /dev/null; then
# Python 3 is installed, create alias for python3 command
    alias py=python3 
fi


# which python, pip
w(){
  pwd
  which python
  which pip
  py -V
}


# find and list a package via search term
pipi () {
    pip list | grep -i "$1"
    }


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'


## Colorize the ls output ##
alias ls='ls --color=auto'
 
## Use a long listing format ##
alias ll='ls -lah'

alias l='ls -CF'

## long listing with hidden fiales
alias la='ls -A'
 
## Show hidden files ##
alias l.='ls -d .* --color=auto'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#######################################
#### git ######

#git fetch all
alias fec="git fetch --all"

#git status with last 5 log
alias gits="fec && git status && echo '.....\n\n' && git_log -5"

# git start-over
# remove all files and init again with an initial commit
git_restart(){
	echo "this may take some time, be patient..."
	rm -rf .git
	git init
	git add .
	git commit -am "initial commit by OZ"
	echo "restarted git..."
}

### derived from jeffreyWay alias for git

## git_undo : undo everything since last commit, incl new files
alias git_undo="git reset --hard && git clean -df"

## git_co: commit current changes
alias git_co="git add . && git commit -m 'WiP'"

## git_log: log the git
alias git_log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"



################################
## Shell info
################################

## directory and file size
alias du="du -ch"

## get file/dir permissions
get_permissions() {
stat -f %Mp%Lp 
}

################################

################################
### DOCKER #####################
# docker info
d(){
	clear
	echo "images------------------------"
	docker images
	echo " "
	echo "volumes------------------------"
	docker volume ls
	echo " "
	echo "network------------------------"
	docker network ls
	echo " "
	echo "containers------------------------"
	docker ps -a
}

### Docker Compose ###########################
alias dc="docker-compose"
alias dcup="dc up -d --build"
alias dcdown="dc down -v --remove-orphans"
##############################################


## .bash_local
if [ -f ~/.bash_local ]; then
	# shellcheck source=/dev/null
	. ~/.bash_local
	# if local conf file is there, than can be used
	alias blo="vim ~/.bash_local"
fi
