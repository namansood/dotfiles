#!/bin/zsh

# step 1: omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm ~/.zshrc
cp .zshrc ~/

# step 2: albert, my butler
mkdir -p ~/.config/albert
cp albert.conf ~/.config/albert/

# step 3: themes and icon packs
 ## theme: matcha
wget https://github.com/vinceliuice/Matcha-gtk-theme/archive/master.zip -O matcha.zip
unzip matcha.zip
chmod +x matcha/install.sh
matcha/install.sh
  ## icon pack: papirus
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

# step 4: fonts
 ## jetbrains mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip -O jetbrainsmono.zip
unzip jetbrainsmono.zip
mkdir -p ~/.local/share/fonts
cp -R jetbrainsmono ~/.local/share/fonts/
 ## source sans pro
wget https://github.com/adobe-fonts/source-sans-pro/archive/release.zip -O sourcesanspro.zip
unzip sourcesanspro.zip
mkdir -p ~/.local/share/fonts/sourcesanspro
cp -R sourcesanspro/TTF/* ~/.local/share/fonts/sourcesanspro/

# step 5: xfce config
cp -R xfce4 ~/.config/

