# dot files and general setup

```shell
cd ~/documents/
git clone git@github.com:wolffshots/dotfiles.git 
ln -sf ~/documents/dotfiles/.config/nvim ~/.config
```

## pre-reqs
- TODO

## git

```shell
git config --global user.name jadon
git config --global user.email 16850875+wolffshots@users.noreply.github.com 
git config --global init.defaultBranch main
git config --global pull.rebase true
```

## this repo

```shell
git clone --bare git@github.com:wolffshots/dotfiles.git 
```
```shell
git clone --bare https://github.com/wolffshots/.dotfiles.git
```
```shell
GIT_DIR=~/.dotfiles.git git fetch origin main:main # to update repo
GIT_DIR=~/.dotfiles.git/ git --work-tree ~/ checkout main # to checkout the files to your home, use `-f` to overwrite changes
GIT_DIR=~/.dotfiles.git/ git --work-tree ~/ pull # to pull changes from then on
```

## zsh

```shell
# TODO add instructions for omz and p10k
chsh -s $(which zsh)
```

## asdf

```shell 
git clone --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0` - check branch
```

## golang

```shell
asdf plugin-add golang
asdf install golang latest
asdf global golang latest
asdf reshim golang` # after using `go get`
```

## extra
### rasbpi
- [zram-config](https://github.com/ecdye/zram-config) 
    - `git clone https://github.com/ecdye/zram-config`
    - `sudo ./zram-config/install.bash` 

