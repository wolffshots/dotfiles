# dot files and general setup

## pre-reqs
- #`apt-add-repository ppa:fish-shell/release-3 && sudo apt update && sudo apt install git fish httpie python3 python-is-python3 pip`
- $`pip install pynvim`

## git
- $`git config --global user.name jadon && git config --global user.email 16850875+wolffshots@users.noreply.github.com && git config --global init.defaultBranch main`

## fish styling
- $`http --body https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`

## nvm
- $`http --body https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash`
- $`omf install nvm && nvm install --lts`

## vim
- $`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

## [rust-lang](https://www.rust-lang.org/learn/get-started)
- $`http --body https://sh.rustup.rs | sh`
- $`fish_add_path $HOME/.cargo/bin`
note: on certain rasbpi's and low spec devices you may need zram-config or similar to get through the installer

## extra
### rasbpi
- [zram-config](https://github.com/ecdye/zram-config) 
    - $`git clone https://github.com/ecdye/zram-config`
    - #`./zram-config/install.bash` 

