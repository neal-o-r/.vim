#! /usr/bin/env bash
# This doesn't work perfectly, Python linking is a pain, but this is a general outline

# (or install Vim from binaries)
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev python3.6-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

sudo apt remove vim vim-runtime gvim
sudo apt remove vim-tiny vim-common vim-gui-common vim-nox

# check that python locations check out!!!
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \
            --enable-gui=gtk2 \
            --enable-cscope \
	    --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
cd ~/vim
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

# install linter dependencies
pip3 install flake8
pip3 install mypy


# clone repo (and submodules)
cd ~
git clone --recursive https://github.com/neal-o-r/.vim.git

cp .vim/.vimrc .

