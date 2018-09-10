# .vim

Vim bits and pieces.

```
#!/usr/bin/env bash

# install vim 8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# install linter dependencies
pip3 install flake8
pip3 install mypy

# clone repo (and submodules)
cd ~
git clone --recursive https://github.com/neal-o-r/.vim.git

cp .vim/.vimrc .
```
