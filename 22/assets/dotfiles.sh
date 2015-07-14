#!/bin/bash
git clone https://github.com/asdf-git/dotscripts.git ~/.dotscripts/
curl -o /home/`whoami`/.bashrc https://raw.githubusercontent.com/asdf-git/dotfiles/master/.bashrc
curl -o /home/`whoami`/.bash_aliases https://raw.githubusercontent.com/asdf-git/dotfiles/master/.bash_aliases
