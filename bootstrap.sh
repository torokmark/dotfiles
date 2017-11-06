#!/bin/bash

: 'dots="
shell/bash_aliases
shell/bash_autocompleteshell/bash_colors
shell/bash_exports
shell/bash_functions
shell/bash_options
shell/bash_prodot
shell/bash_prompt
shell/bashrc
tool/curlrc
tool/wgetrc
ruby/gemrc
ruby/rspec
git/gitattributes
git/gitignore
git/gitconfig
git/gitmessage
vim/vimrc
vim/vim
" ##########'

dots=(
  "vim/vimrc"
  "vim/vim"
  "tool/curlrc"
  "tool/wgetrc"
  "ruby/gemrc"
  "ruby/rspec"
  "git/gitattributes"
  "git/gitignore"
  "git/gitconfig"
  "git/gitmessage"
)

# create dotfiles_old in homedir
echo -n "Creating dotfiles_old for backup of any existing dotfiles in ~ ..."
mkdir -p "$HOME/dotfiles_old"
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any dots in the ~/dotfiles directory specified in $dots
for dot in "${dots[@]}"; do
  puredot="${dot##*/}"
  echo "===>> Working with $puredot ========"
  if [ -e "$HOME/.$puredot" ]; then
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv "$HOME/.$puredot" "$HOME/dotfiles_old/"
  fi  
  echo "Making symlink on $puredot"
  ln -s "$HOME/dotfiles/$dot" "$HOME/.$puredot"
  echo "$puredot is done"
done

