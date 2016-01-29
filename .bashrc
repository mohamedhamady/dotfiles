# .bashrc

eval `dircolors ~/.dircolors`
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.bash_profile

# User specific aliases and functions

keychain ~/.ssh/id_rsa
source ~/.keychain/*-sh
shopt -s histappend
PROPMT_COMMAND='history -n; history -a'
HISTSIZE=100000
HISTFILESIZE=100000
alias ls='ls --color=auto -ph'
alias ll='ls -la'
alias rm='rm -i'

