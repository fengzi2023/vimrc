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
source ~/.vim/vimrc.vundle
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
  \ 'dir':  '\v[\/]\.(git|hg|svn|output)$',  
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
colorscheme molokai 
" let g:molokai_original = 1
let g:rehash256 = 1

" colorscheme solarized
" let g:airline_theme='molokai'
let g:airline_theme='base16_bright'
set laststatus=2
" let g:solarized_termcolors=256

" 语法检查
syntax on

" 显示行号
set nu

" CtrlP
"
" neocomplete自动补全
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" snippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
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

