"定义快捷键的前缀，即<Leader>
" let mapleader=";"
let mapleader="\<Space>"

" 搜索文件
nnoremap <Leader>o :CtrlP<CR>
" 保存文件
nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V

"vim-plug 插件管理器 , Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'https://github.com/luofei614/vim-plug', { 'dir':'~/.vim/my'}
"Plug 'AutoComplPop'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Tagbar'
Plug 'axiaoxin/vim-json-line-format'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
" 主题
Plug 'molokai'
Plug 'Solarized'
"bookmark  mm 添加书签,  mn 移动书签  mp 移动到前一个书签  ma 删除所有书签
Plug 'MattesGroeger/vim-bookmarks'
"快速跳转到字符
Plug 'EasyMotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/luofei614/vim-golang.git'
Plug 'https://github.com/burnettk/vim-angular.git'
"检查程序语法错误
Plug 'https://github.com/scrooloose/syntastic.git'
" 自动补全
Plug 'https://github.com/Valloric/YouCompleteMe.git'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'

" 选择区域
Plug 'terryma/vim-expand-region'

" 中文输入
Plug 'vimim'

call plug#end()

"退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
set t_ti= t_te=

"搜索忽略大小写
set ignorecase

" 使用F2键控制粘贴是否自动缩进
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set list lcs=tab:\¦\   " 使用 ¦ 来显示 tab 缩进

if has("autocmd")   " 打开时光标放在上次退出时的位置
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

"搜索高亮
set hlsearch
"set nohlsearch  " 关闭搜索高亮

"设置NERDTreetagbar的宽度
let g:NERDTreeWinSize = 20
let g:tagbar_width=20

"颜色主题设置
set t_Co=256
let g:solarized_termcolors=16
"两种流行风格的主题
"colorscheme molokai
"set background=dark
colorscheme solarized
set background=light

"快捷键设置
map <F11> :NERDTreeToggle<CR>
map! <F11> <Esc>:NERDTreeToggle<CR>

map <F12> :TagbarToggle<CR>
map! <F12> <Esc>:TagbarToggle<CR>

"快速对齐
vmap ga  <Plug>(EasyAlign)
nmap ga  <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
      let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" 快速注释
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" 切换tab页 用gt
map     <C-T>       :tabnew<CR>

"在mac下iterm终端标题中中显示文件名称
autocmd BufEnter *.* exe 'silent ! echo -ne "\033];%:t\007"'

"支持鼠标
"set mouse=a

"语法高亮
syntax enable
syntax on
set so=10
filetype on         " 打开文件类型支持
filetype plugin on  " 打开文件类型插件支持
filetype indent on  " 打开文件类型缩进支持
set autoindent
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set modeline      " 底部的模式行
set cursorline    " 高亮光标所在行
set cursorcolumn  " 高亮光标所在列

set smartcase   " 搜索时，智能大小写
set incsearch   " incremental search 
"set autochdir   " 打开文件时，自动 cd 到文件所在目

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

" 文件编码
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"语法折叠
set foldmethod=syntax
set foldcolumn=0  " 设置折叠区域的宽度
set foldlevel=100
" 用空格键来开关折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"加快速度
"set synmaxcol=200
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set scrolljump=5
"删除键
set backspace=eol,start,indent

"基本设置
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double
set nowrap "自动换行

"设置无备份
set nobackup
set nowritebackup

" 添加自定义文件类型为nerdcommenter插件，比如打开txt文件后， 执行:set ft=txt
" ,然后就可以使用nerdcommenter进行注释
let g:NERDCustomDelimiters = {
    \ 'txt': { 'left': '#'}
    \ }

" YCM 配置
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_invoke_completion=''
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \ 'ini' : 1,
      \ 'log' : 1,
      \ 'json' : 1,
      \}
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

 " 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" vim-expand-region 设置
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" 自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" 在文件中快速跳转
nnoremap <CR> G
nnoremap <BS> gg

" 查找与替换升级
"vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR> :<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
"omap s :normal vs<CR>

" 快速选择粘贴的文本
noremap gV `[v`]
