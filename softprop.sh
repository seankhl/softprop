#TODO: github stuff

# get our current dir. do not muck with repo structure
FAKEHOME="`pwd`"

# of course, there's no point to
if [ "$FAKEHOME" == "$HOME" ]; then
    echo "Pointless to have fakehome be the same as home, silly goose!"
    exit 1
fi

# bash stuff... we'll concatenate, since there may be machine-specific configs
echo -e "\n# added by softprop.sh script\n. $FAKEHOME/.bashrc" >> $HOME/.bashrc

# tmux stuff
ln -s $FAKEHOME/.tmux.conf $HOME/.tmux.conf 

# vim stuff
ln -s $FAKEHOME/.vimrc $HOME/.vimrc

# only copy individual .vim folders... there are some history settings that
# shouldn't get mucked with
mkdir -p $HOME/.vim
find $FAKEHOME/.vim/* -prune -type d | while read folder; do \
    leaf=${folder#*softprop/*}
    echo $leaf
    ln -s $FAKEHOME/$leaf $HOME/$leaf
done

# xfce terminal -- only the best
ln -s $FAKEHOME/terminalrc $HOME/.config/xfce4/terminal/terminalrc 
ln -s $FAKEHOME/accels.scm $HOME/.config/xfce4/terminal/accels.scm

