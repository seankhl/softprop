#TODO: github stuff

# get our current dir. do not muck with repo structure
FAKEHOME="`pwd`"
softmsg="added by softprop.sh script"

# of course, there's no point to have fakehome and home be the same
if [ "$FAKEHOME" == "$HOME" ]; then
    echo "Pointless to have fakehome be the same as home, silly goose!"
    exit 1
fi

# bash stuff... we'll concatenate, since there may be machine-specific configs
if [ -e $HOME/.bashrc ]; then
    if ! grep -q "$softmsg" $HOME/.bashrc; then
        echo -e "\n# "$softmsg"\n. $FAKEHOME/.bashrc" >> $HOME/.bashrc
    else
        echo "detected that bashrc already fixed"
    fi
else
    ln -s $FAKEHOME/.bashrc $HOME/.bashrc
fi

# tmux stuff
if ! [ -e $HOME/.tmux.conf ]; then
    ln -s $FAKEHOME/.tmux.conf $HOME/.tmux.conf 
fi

# bash stuff... we'll concatenate, since there may be machine-specific configs
if [ -e $HOME/.vimrc ]; then
    if ! grep -q "$softmsg" $HOME/.vimrc; then
        echo -e "\n\" "$softmsg"\nsource $FAKEHOME/.vimrc" >> $HOME/.vimrc
    else
        echo "detected that vimrc already fixed"
    fi
else
    ln -s $FAKEHOME/.vimrc $HOME/.vimrc
fi

# only copy individual .vim folders... there are some history settings that
# shouldn't get mucked with
mkdir -p $HOME/.vim
find $FAKEHOME/.vim/* -prune -type d | while read folder; do \
    leaf=${folder#*softprop/*}
    if ! [ -e $HOME/$leaf ]; then
        ln -s $FAKEHOME/$leaf $HOME/$leaf
    fi
done

# xfce terminal -- only the best
# TODO: detect existence of xfce4
ln -s $FAKEHOME/terminalrc $HOME/.config/xfce4/terminal/terminalrc 
ln -s $FAKEHOME/accels.scm $HOME/.config/xfce4/terminal/accels.scm

