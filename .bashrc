# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

complete -cf sudo
complete -cf man
shopt -s autocd
source /usr/share/git/completion/git-prompt.sh 

alias ls='ls --color=auto'
alias df='dfc'

# PS1='[\u@\h \W]\$ '
PS1='\[\e[1;32m\][\u@\h \W$(__git_ps1)]\$\[\e[0m\] '

export EDITOR='vim'
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/usr/bin:$HOME/go/bin
export LD_LIBRARY_PATH=$HOME/usr/lib

# Custom commands
alias suspend='systemctl suspend'
alias wifirecompile='sudo dkms autoinstall && sudo modprobe wl'
alias update='sudo pacman -Suy'
alias hibernate='systemctl hibernate'
alias lines='git ls-files | xargs wc -l'
alias cd..='cd ..'
alias blackscreen='xset s off && xset -dpms'

# PYTHONPATH
export PYTHONPATH=$PYTHONPATH:~/code/blocks/
export PYTHONPATH=$PYTHONPATH:~/code/fuel/
export PYTHONPATH=$PYTHONPATH:~/code/picklable-itertools/
export PYTHONPATH=$PYTHONPATH:~/code/Theano/

# Stanford NER
export STANFORD_MODELS=~/code/snips/stanford-ner-2014-06-16/

get_dir() {
	printf "%s" $(pwd | sed "s:$HOME:~:")
}

get_sha() {
	git rev-parse --short HEAD 2>/dev/null
}

# Turn off repeat keys
# xset r off

# Latex package manager
alias latex-package-manager='tllocalmgr'

bind -r '\C-s'
stty -ixon

. /home/eloi/code/torch/install/bin/torch-activate
