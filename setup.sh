#!/bin/sh

D=`dirname $0`
dir=`cd $D; pwd`

is_raspberry_pi() {
    [ -r /proc/device-tree/compatible ] &&
        tr '\0' '\n' < /proc/device-tree/compatible |
        grep -q '^raspberrypi,'
}

ln -s $dir/.emacs ~/
ln -s $dir/.emacs-japanese.el ~/
ln -s $dir/.emacs-keybind.el ~/

if is_raspberry_pi; then
  ln -s $dir/.tmux-raspi.conf ~/.tmux.conf
else
  ln -s $dir/.tmux.conf ~/
fi


if ! grep '# git' ~/.bashrc 2>&1 > /dev/null ; then
    cat $dir/bashrc-git.txt >> ~/.bashrc
fi

echo 'refer docker_config.json for Docker'

