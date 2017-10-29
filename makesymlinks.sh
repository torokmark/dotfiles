#!/bin/bash

: 'files="
shell/bash_aliases
shell/bash_autocompleteshell/bash_colors
shell/bash_exports
shell/bash_functions
shell/bash_options
shell/bash_profile
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
" ##########'

files=("vim/vimrc"
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

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in "${files[@]}"; do
  purefile="${file##*/}"
  echo "===>> Working with $purefile ========"
  if [ -e "$HOME/$purefile" ]; then
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv "$HOME/$purefile" "$HOME/dotfiles_old/"
  fi  
  echo "Copying $purefile to the home folder"
  cp "$HOME/dotfiles/$file" "$HOME/.$purefile"
  echo "$purefile is done"
done

