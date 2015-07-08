FAKEHOME="`pwd`"
if [ "$FAKEHOME" == "$HOME" ]; then
    echo "Pointless to have fakehome be the same as home, silly goose!"
    exit 1
fi

echo -e "\n# added by softprop.sh script\n. $FAKEHOME/.bashrc" >> $HOME/.bashrc

ln -s $HOME/.tmux.conf $FAKEHOME/.tmux.conf
ln -s $HOME/.vimrc $FAKEHOME/.vimrc
ln -s $HOME/.vim $FAKEHOME/.vim
ln -s $HOME/.config/xfce4/terminal/terminalrc $FAKEHOME/terminalrc
ln -s $HOME/.config/xfce4/terminal/terminalrc $FAKEHOME/accels.scm

