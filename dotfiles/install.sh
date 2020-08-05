#!/bin/bash

# Auto install plugins

# Initiate files

banner='      
      .__                                      
___  _|__| _____  __ _____  __________   ____  
\  \/ /  |/     \|  |  \  \/  /\_  __ \_/ ___\ 
 \   /|  |  Y Y  \  |  />    <  |  | \/\  \___ 
  \_/ |__|__|_|  /____//__/\_ \ |__|    \___  >
               \/            \/             \/ '

info='Done..

NOTE: >>>

If plugins does not work correctly, enable it manually:

ctrl+b + I >> for tmux logging plugin (reload environment)
open vim + :PlugInstall then :source % >> VIM plugins
python3 .vim/plugged/YouCompleteMe/install.py --all
 
Resource Links / Documentation:

https://github.com/tmux-plugins/tmux-logging
https://github.com/junegunn/vim-plug
https://github.com/ycm-core/YouCompleteMe#linux-64-bit
                                                      <<<'
install() {

# Driver function


    echo
    echo "Downloading dependencies.."
    echo
    sudo apt install -y cmake gcc
    echo
    echo 
    echo "Removing current configuration files.."
    echo
    sleep 1
    rm -rf $HOME/.vim
    rm -rf $HOME/.tmux
    rm -rfv $HOME/.vimrc
    rm -rfv $HOME/.tmux.conf
    rm -rfv $HOME/.bash_logout
    rm -rfv $HOME/.p10k.zsh
    echo 

    echo "Copying resources.."
    echo
    sleep 2
    mkdir $HOME/.vim
    cp -frv conf/bashrc $HOME/.bashrc
    cp -frv conf/bash_logout $HOME/.bash_logout
    cp -frv conf/tmux.conf $HOME/.tmux.conf
    cp -frv conf/vimrc $HOME/.vimrc
    cp -frv conf/p10k.zsh $HOME/.p10k.zsh
    echo

    echo "Installing plugins.."
    sleep 2

# tmux plugin
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf

# vim plugin
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo -e "$info"

}


# Start

echo -e "$banner"
echo
echo "This is overwrite all your configuration files"
echo ".vimrc"
echo ".tmux.conf"
echo ".bashrc"
echo ".bash_logout"
echo

while true; do
    read -p "Do you want to continue?(y/n): " yn
    case $yn in
        [yY]|[yY][eE][sS]) 
            echo $yn
            install
            break
            ;;
        [nN]|[nN][oO])
            echo $yn
            exit
            ;;
        *) 
            continue
            ;;
    esac
done
