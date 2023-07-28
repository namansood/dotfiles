#!/usr/bin/env zsh

set -euo pipefail

DOTFILES=(
	vimrc
	zprofile
	zshrc
	plan
)

echo "Setting up oh-my-zsh"
rm -rf ~/.oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

echo "Downloading zsh theme"
mkdir -p ~/.oh-my-zsh/custom/themes/
wget -xqO ~/.oh-my-zsh/custom/themes/aphrodite.zsh-theme https://github.com/win0err/aphrodite-terminal-theme/raw/master/aphrodite.zsh-theme

for f in ${DOTFILES}
do
	TARGET="$(pwd)/$f"
	LINK="$HOME/.$f"
	echo "Linking $LINK -> $TARGET"
	ln -sf $TARGET $LINK
done

mkdir -p ~/bin
for f in bin/*
do
	FILENAME=$(echo $f | awk -F'/' '{print $2}')
	TARGET="$(pwd)/bin/$FILENAME"
	LINK="$HOME/bin/$FILENAME"
	echo "Linking $LINK -> $TARGET"
	ln -sf $TARGET $LINK
	chmod +x $LINK
done

exec zsh
