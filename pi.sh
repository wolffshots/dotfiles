#!/usr/bin/bash

sudo apt install -y software-properties-common
sudo apt update && sudo apt install -y git fish httpie python3 python-is-python3 pip vim && sudo apt upgrade -y
pip install pynvim
git config --global user.name $USER 
git config --global user.email 16850875+wolffshots@users.noreply.github.com 
git config --global init.defaultBranch main 
git config --global pull.merge true 
git clone --bare --depth 1 https://github.com/wolffshots/.dotfiles.git 
GIT_DIR=~/.dotfiles.git git fetch origin main:main
GIT_DIR=~/.dotfiles.git/ git --work-tree ~/ checkout main 
http --body https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish 
sudo chsh -s /usr/bin/fish $USER
git clone --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions 
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git 
asdf install golang latest && asdf reshim golang 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo now you should reboot and use sudo raspi-config to configure the pi fs overlay
