#!/bin/sh

dir=`dirname $0`

ln -s $dir/.emacs ~/
ln -s $dir/.emacs-japanese.el ~/
ln -s $dir/.emacs-keybind.el ~/
ln -s $dir/.screenrc ~/
ln -s $dir/.tmux.conf ~/

if ! grep '# git' ~/.bashrc 2>&1 > /dev/null ; then
    cat $dir/bashrc-git.txt >> ~/.bashrc
fi

echo 'refer docker_config.json for Docker'

