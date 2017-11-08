" basic settings ---------------------- {{{

" 设置用户配置信息
let g:user_name = "fengyuwei"
let g:user_email = "fengyuwei@baidu.com"
let g:user_company = "Baidu Inc."
let g:user_deparment = "Tieba"
"
" 好像大家都这么写
set nocompatible

" 设置leader按键
let mapleader = ";"
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

" 把tabstop,shiftwidth设置成同一个值，加上expandtab，这样就会只用space，而不用tab了，这样不管tabstop怎么变样式也不会花了。
" 设置tab键转化成空格模式
set expandtab
" Tab键显示宽度
set tabstop=4
" Tab键在编辑时的宽度 
set softtabstop=4
" 自动缩进的空格数 
set shiftwidth=4

" }}}

" vundle basic settings -----------------------{{{
if filereadable(expand("~/.vim/vimrc.vundle")) 
    source ~/.vim/vimrc.vundle
endif
"}}}

" custome function settings -----------------------{{{
if filereadable(expand("~/.vim/vimrc.custom")) 
    source ~/.vim/vimrc.custom
endif
"}}}

" vundle plugin settings ---------------------- {{{

" scrooloose/nerdtree
" 树快捷键
nnoremap <leader>t :NERDTreeToggle<cr>

" CtrlP
" Default setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" CtrlP 搜索忽略文件
let g:ctrlp_custom_ignore = {  
  \ 'dir':  '\v[\/]\.(git|hg|svn|output)$',  
  \ 'file': '\v\.(exe|so|dll|dmg|pdf|word|jpg|gif)$',  
  \ 'link': 'some_bad_symbolic_links',  
  \ }

" 主题设置

set background=dark
colorscheme molokai 
" let g:molokai_original = 1
let g:rehash256 = 1

" let g:airline_theme='molokai'
let g:airline_theme='base16_bright'

" 显示状态栏
set laststatus=2

" 语法检查
syntax on
" 显示行号
set nu

" go 语言配置
let g:go_disable_autoinstall = 0

" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmDiags<CR>

"}}}

" custom map settings ---------------------- {{{
" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>v
inoremap <C-^> <C-o><C-^>

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
nnoremap <leader>n :setlocal number!<cr>

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
nnoremap <S-q> :wincmd w<CR>
nnoremap <S-e> :wincmd W<CR>

" new tab
noremap <C-t><C-t> :tabnew .<CR>
" close tab
noremap <C-t><C-w> :tabclose<CR> 

" }}}

" Vimscript file settings ---------------------- {{{
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END
" }}}

" Vimscript Complicated map settings --------------------{{{
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" 复杂的map配置
" 在当前的单词加上双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" visual-block模式下，在选择的单词上加上双引号
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>`<<c-v>`>l
" }}}

" vim: set ts=4 sw=4 tw=78 et :
