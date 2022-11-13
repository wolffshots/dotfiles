# dot files and general setup

## pre-reqs
- `sudo apt install software-properties-common` - only required on raspbian
- `sudo apt-add-repository ppa:fish-shell/release-3 && sudo apt update && sudo apt install git fish httpie python3 python-is-python3 pip && sudo apt upgrade`
- `pip install pynvim`

## git
- `git config --global user.name jadon && git config --global user.email 16850875+wolffshots@users.noreply.github.com && git config --global init.defaultBranch main`

## this repo
- `git clone --bare git@github.com:wolffshots/.dotfiles.git` or `git clone --bare https://github.com/wolffshots/.dotfiles.git`
- `GIT_DIR=~/.dotfiles.git git fetch origin main:main` - to update repo
- `GIT_DIR=~/.dotfiles.git/ git --work-tree ~/ checkout main` to checkout the files to your home, use `-f` to overwrite changes
- `GIT_DIR=~/.dotfiles.git/ git --work-tree ~/ pull` to pull changes from then on

## fish styling
- `http --body https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`

## nvm
- `http --body https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash`
- `omf install nvm && nvm install --lts`

## vim
- `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

## [rust-lang](https://www.rust-lang.org/learn/get-started)
- `http --body https://sh.rustup.rs | sh`
- `fish_add_path $HOME/.cargo/bin`
note: on certain rasbpi's and low spec devices you may need zram-config or similar to get through the installer

## extra
### rasbpi
- [zram-config](https://github.com/ecdye/zram-config) 
    - `git clone https://github.com/ecdye/zram-config`
    - `sudo ./zram-config/install.bash` 

