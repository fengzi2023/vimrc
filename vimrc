" basic settings ---------------------- {{{
" 好像大家都这么写
set nocompatible

" 设置leader按键
let mapleader = "-"
let localmapleader = "\\"

" 设置搜索模式
set hlsearch
set incsearch

" 允许折叠 
set foldenable       
" 手动折叠
set foldmethod=manual   

" 编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

" 自动缩进
set autoindent
" set cindent

" Tab键的宽度
set tabstop=4
set expandtab
" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" }}}

" vundle basic settings -----------------------{{{
" vundlle.vim 基础配置
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin 'git@github.com:fengyuwei01/potion-for-vimscript.git', {'name': 'potion'}

" 快速添加注释
Plugin 'scrooloose/nerdcommenter'
" 好看的状态栏主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 好用的文件查找插件
Plugin 'ctrlpvim/ctrlp.vim'
" 好看的主题
Plugin 'altercation/vim-colors-solarized'
" 查看文件列表插件
Plugin 'scrooloose/nerdtree'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
"}}}

" vundle map settings ---------------------- {{{

" scrooloose/nerdtree
nnoremap <leader>t :NERDTree<cr>

" CtrlP
" Default setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" CtrlP 搜索忽略文件
let g:ctrlp_custom_ignore = {  
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',  
  \ 'file': '\v\.(exe|so|dll|dmg|pdf|word|jpg|gif)$',  
  \ 'link': 'some_bad_symbolic_links',  
  \ }

" scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" 
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" 主题设置
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
" let g:solarized_termcolors=256

" 语法检查
syntax on

" CtrlP

"}}}

" custom map settings ---------------------- {{{
" 删除一行
noremap <leader>d dd

" 在新窗口编辑VIMRC
" TODO 添加如果已存在vimrc窗口，切换到该页面
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 生效VIMRC
nnoremap <leader>sv :source $MYVIMRC<cr> 
" 提交VIMRC
" TODO

" 我的配置 test
" 快速保存按键，不知道不不会出现BUG
nnoremap ;w :w<cr>

" 不一定好用，超级h l
nnoremap H 0
nnoremap L $

" 设置切换
nnoremap <leader>N :setlocal number!<cr>

" 复杂的map配置
" 在当前的单词加上双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" visual-block模式下，在选择的单词上加上双引号
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>`<<c-v>`>l

" 解放左手
inoremap jk <esc>
" 修改<esc>按键无效
inoremap <esc> <nop>
" 修改方向键无效 TODO
" noremap 

" tab快速切换配置
" TODO 需要结合Mac iterm2 配置<option>按键修改为<esc>+使用
noremap <ESC>1 1gt 
noremap <ESC>2 2gt 
noremap <ESC>3 3gt 
noremap <ESC>4 4gt 
noremap <ESC>5 5gt 
noremap <ESC>6 6gt 
noremap <ESC>7 7gt 
noremap <ESC>8 8gt 
noremap <ESC>9 9gt 

" new tab
map <C-t><C-t> :tabnew .<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" 窗口快捷键
" 设置最小宽度和高度
set wmw=0         " set the min width of a window to 0 so we can maximize
set wmh=0         " set the min height of a window to 0 so we can maximize

" 上下左右切换
noremap <leader>h :wincmd h<CR> 
noremap <leader>j :wincmd j<CR> 
noremap <leader>k :wincmd k<CR> 
noremap <leader>l :wincmd l<CR> 

" Quickly resize windows use +/-
noremap - <C-W>-
noremap + <C-W>+
noremap > <C-W>>
noremap < <C-W><

" Loop to switch windows
nnoremap <S-w> :wincmd w<CR>

" new tab
noremap <C-t><C-t> :tabnew .<CR>
" close tab
noremap <C-t><C-w> :tabclose<CR> 

" }}}

" autocmd settings ---------------------- {{{
" TODO 暂时没用
" autocmd 自动加载
" autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
" 没有用是啥问题
" autocmd FileType php nnoremap <buffer> <localleader>c I//<esc>
" }}}

" statusline settings ---------------------- {{{
" TODO 现在使用airlineTheme插件美滋滋~
" 设置状态栏
" 空格需要反斜线进行转义
" set statusline=%f\ -\ FileType:\ %y
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vimscript Complicated map settings --------------------{{{
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" noremap <leader>cn :cnext<cr>
" }}}

