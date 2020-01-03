#!/bin/sh

dir=`dirname $0`

ln -s $dir/.emacs ~/
ln -s $dir/.emacs-japanese.el ~/
ln -s $dir/.emacs-keybind.el ~/
ln -s $dir/.screenrc ~/

echo 'refer docker_config.json for Docker'

