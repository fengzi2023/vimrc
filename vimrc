" basic settings ---------------------- {{{

" 设置用户配置信息
let g:user_name = "fengyuwei"
let g:user_email = "fengyuwei@baidu.com"
let g:user_company = "Baidu Inc."
let g:user_deparment = "Tieba"

set nocompatible

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

" leader key
let mapleader = ";"
let localmapleader = "\\"

" theme
set background=dark
colorscheme molokai 
" let g:molokai_original = 1
let g:rehash256 = 1
set laststatus=2

syntax on
set nu

" highlight current column and line
" set cursorcolumn    
" set cursorline    

" disable mouse
set mouse-=a              

" highlight search
set hlsearch
set incsearch

" enable fold
set foldenable       
set foldmethod=manual  " options: manual, indent, expr, syntax, diff, marker 

" encoding
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

" indent
set smartindent
set autoindent
" set cindent

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class " Ignore compiled files

" set backspace=eol,start,indent
set backspace=eol,start,indent
" }}}

" custom map settings ---------------------- {{{
" edit VIMRC in new window
" TODO 添加如果已存在vimrc窗口，切换到该页面
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source VIMRC
nnoremap <leader>sv :source $MYVIMRC<cr> 
" TODO 提交VIMRC

"goto older/newer position in change list
nnoremap <silent> ( g;
nnoremap <silent> ) g,

" use ctrl-c to copy to system clipboard
" vnoremap <C-c> "*y

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>v
inoremap <C-^> <C-o><C-^>

" quick save
nnoremap ;w :w<cr>

nnoremap H 0
nnoremap L $

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

"no Highlight
noremap <silent><leader>/ :nohls<CR>

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use 'm/M' to move among buffers
noremap m :bn<CR>
noremap M :bp<CR>
" toggle between two buffers
nnoremap t <C-^>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quick move in insert mode
inoremap <C-o> <Esc>o
inoremap <C-a> <Home>
inoremap <C-e> <End>

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

" 设置最小宽度和高度
set wmw=0         " set the min width of a window to 0 so we can maximize
set wmh=0         " set the min height of a window to 0 so we can maximize

" 上下左右切换
noremap <C-h> :wincmd h<CR> 
noremap <C-j> :wincmd j<CR> 
noremap <C-k> :wincmd k<CR> 
noremap <C-l> :wincmd l<CR> 

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
" 在当前的单词加上双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" visual-block模式下，在选择的单词上加上双引号
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>`<<c-v>`>l
" }}}

" 进入对应filetype的snippets进行编辑
map <leader>se :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<C-l>"
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>t :TagbarToggle<CR>

" vim: set ts=4 sw=4 tw=78 et :
