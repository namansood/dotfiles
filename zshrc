# PATH changes are in .zshenv

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Aphrodite theme: https://github.com/win0err/aphrodite-terminal-theme
ZSH_THEME="aphrodite"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# oh-my-zsh plugins
plugins=()

source $ZSH/oh-my-zsh.sh

exp() {
	cd "$@" && ls
}

cdmk() {
	mkdir -p "$@" && cd "$@"
}

# use gvim -v as vim if vim does not exist
# on Fedora, vim is compiled without copy-paste support,
# but gvim is compiled with
if which gvim &>/dev/null && ! which vim &>/dev/null; then
	alias vim='gvim -v'
	export EDITOR='gvim -v'
else
	export EDITOR=vim
fi

# bat config
if which bat &> /dev/null; then
	# tell it to use 8-bit terminal colors
	export BAT_THEME="ansi"

	# tell man to use it as the pager
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	export MANROFFOPT="-c"
fi

alias ':q'=exit
alias open=xdg-open
alias lntexheader='ln -s ~/coursenotes/nsdheader.sty $(pwd)'
