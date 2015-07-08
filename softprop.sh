FAKEHOME="`pwd`"

echo -e "\n# added by softprop.sh script\n. $FAKEHOME/.softproprc" >> $HOME/.bashrc

ln -s ~/.tmux.conf $FAKEHOME/.tmux.conf
ln -s ~/.vimrc $FAKEHOME/.vimrc
ln -s ~/.vim $FAKEHOME/.vim
ln -s ~/.config/xfce4/terminal/terminalrc $FAKEHOME/terminalrc
ln -s ~/.config/xfce4/terminal/terminalrc $FAKEHOME/accels.scm

