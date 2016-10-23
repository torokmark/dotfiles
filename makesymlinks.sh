#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir
files="shell:aliases shell:bash_prompt shell:bashrc tool:curlrc tool:wgetrc ruby:gemrc ruby:rspec git:gitattributes git:gitignore git:gitconfig git:gitmessage vim:vimrc vim:vim"
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	idx=`expr index $file :`
	purefile=${file:idx}
	if [ -e "../.$purefile" ]; then
    	echo "Moving any existing dotfiles from ~ to $olddir"
    	mv ~/.$purefile ~/dotfiles_old/
	fi
    echo "Creating symlink to $purefile in home directory."
	link=${file//":"/"/"}
    ln -s $dir/$link ~/.$purefile
done

