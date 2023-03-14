function config --wraps='git' --description 'manage dotfile config'
  git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv; 
end
