#!/usr/bin/env bash
# vimrc安装脚本

[ -z "$VIMRC_GIT_URL"] && VIMRC_GIT_URL='git@github.com:fengyuwei01/vimrc.git'

if [ -z "$HOME" ]; then
    printf "You must have your HOME environmental variable set to continue.\n" >&2
    exit 1
fi

[ -z "$VIMRC_HOME" ] && VIMRC_HOME="$HOME/.vim"
[ -z "$VIMRC" ] && VIMRC="$HOME/.vimrc"

# 先执行备份
if [ -e "$VIMRC" ]; then
    today=`date +%Y%m%d_%s`
    mv -v -u "$VIMRC" "$VIMRC.$today"
fi
if [ -e "$VIMRC_HOME" ]; then
    today=`date +%Y%m%d_%s`
    mv -v -u "$VIMRC_HOME" "$VIMRC_HOME.$today"
fi

# GIT CLONE
printf "start git clone.[%s] [%s]\n" $VIMRC_GIT_URL $VIMRC_HOME
git clone $VIMRC_GIT_URL $VIMRC_HOME
cd $VIMRC_HOME
git submodule update --init --recursive

ln -sf $VIMRC_HOME/vimrc.vundle $HOME/.vimrc

printf "start initalize vundle.\n"
vim "+set nomore" "+PluginInstall" "+PluginClean" "+qall" 2>/dev/null

printf "start install vimrc.\n"
ln -sf $VIMRC_HOME/vimrc $HOME/.vimrc

printf "install success,enjoy :)\n"
