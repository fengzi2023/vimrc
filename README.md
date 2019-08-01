# vimrc
My vimrc

## PRE-INSTALL
1. ripgrep [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep/tree/master)

## INSTALL
```
curl https://raw.githubusercontent.com/fengzi01/vimrc/master/install.sh -L > install.sh && sh install.sh
```
## FIX IT

Compile YouCompleteMe plugin:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --go-completer --clang-completer
```

## INSTALL YCM
 - cd bundle/YouCompleteMe/
 - git submodule update --init --recursive
 - ./install.py --clang-completer --java-completer --go-completer

## Inspired by:

 1. [bigvim](https://github.com/ruanyl/bigvim)
 2. [k-vim](https://github.com/wklken/k-vim)


