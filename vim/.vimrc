"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键的前缀，即<Leader>
let mapleader="\<Space>"

" 支持鼠标
set mouse-=a

" --------------------
" 查找与替换升级用法
" 使用 /something 查找
" 使用 cs 替换第一个，然后按 <Esc> 键
" 使用 n.n.n.n.n. 查找以及替换余下匹配项, 不知为何用，只能用cw
" --------------------
" vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
" omap s :normal vs<CR>

" 语法高亮
syntax enable
set so=3
set nu
set rnu
filetype on         " 打开文件类型支持
filetype plugin on  " 打开文件类型插件支持
filetype indent on  " 打开文件类型缩进支持
set autoindent
set smartindent
set autoread
set showcmd
set showmode
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限"
set tabstop=4
set shiftwidth=4
set expandtab     " tab被扩展为空格
set modeline      " 底部的模式行
set cursorline    " 高亮光标所在行
set cursorcolumn  " 高亮光标所在列
set smartcase     " 搜索时，智能大小写
set incsearch     " incremental search 
set autochdir     " 打开文件时，自动 cd 到文件所在目
" 文件编码
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8
" 语法折叠
set foldmethod=indent
set foldcolumn=0  " 设置折叠区域的宽度
set foldlevel=10
" 用空格键来开关折叠
" nnoremap <space>  @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 加快速度
" set synmaxcol=200
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set scrolljump=5
" 删除键
set backspace=eol,start,indent
" 基本设置
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
set ambiwidth=double
set wrap            "自动折行,与textwidth控制的自动换行有区别
set linebreak 
set showmatch
" 设置无备份
set nobackup
set nowritebackup
set noswapfile

" 快速选择粘贴的文本
noremap gV `[v`]

" check whitespace and display it
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" 保存文件
nnoremap <Leader>w :w!<CR>

" modify file without change to root
command W w !sudo tee % > /dev/null

" yapf format python file
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

" 打开／关闭目录树
map  <F11> :NERDTreeToggle<CR>
map! <F11> <Esc>:NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

" 宏测试
let @m = "Y6GpF1C7 112joNew text.ZZ"
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']

"搜索高亮
set hlsearch

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" suppert os clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  vim-plug Manager, Make sure you use single quotes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/luofei614/vim-plug', { 'dir':'~/.vim/my'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'vim-scripts/Tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'vim-scripts/vimim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'davidhalter/jedi-vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'

Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'suan/vim-instant-markdown'
Plug 'w0rp/ale'
Plug 'liuchengxu/space-vim-dark'
Plug 'axiaoxin/vim-json-line-format'   " <Leader>wj   格式化为json格式
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --------------------
" vim-easy-align
" vip<leader>a is normal used. - means from right to left. 
" 默认左对齐
" <leader>a<space>  首个空格对齐
" <leader>a2<space> 第二个空格对齐
" <leader>a-<space> 倒数第一个空格对齐
" <leader>a-2<space> 倒数第二个空格对齐
" <leader>a*<space> 所有空格依次对齐
" 右对齐
" <leader>a<Enter>*<space>
" 也可用如下
" :easyalign=is
" :easyalign=id
" :easyalign=in
" :easyalign -= (按最后一个=)
" --------------------
xmap <leader>a  <Plug>(EasyAlign)
nmap <leader>a  <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
      let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" --------------------
"  ale
" --------------------
" must first install flake8 that using 'brew install flake8'
let g:ale_history_log_output = 1
"let g:ale_sign_column_always = 1
let g:ale_linters = { 'python': ['flake8'], }
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=%{LinterStatus()}

" --------------------
"  goyo
" --------------------
function! s:goyo_before()
     set nonumber
endfunction
function! s:goyo_after()
     set number
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
nmap <leader>h :Goyo<cr>
" 进入goyo模式后自动触发limelight,退出后则关闭
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:goyo_width = 120
let g:goyo_margin_top = 4
let g:goyo_margin_bottom = 4
let g:goyo_linenr = 0

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Default: 0.5
let g:limelight_default_coefficient = 0.8
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Highlighting priority (default: 10)
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" --------------------
"  jedi-vim
" ---------support command---------
" Completion <C-Space>  注意：需手工呼出
" Goto assignments <leader>g (typical goto function)
" Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements) 跳转到函数定义处
" Show Documentation/Pydoc K (shows a popup with assignments)
" Renaming <leader>r
" Usages <leader>n (shows all the usages of a name)
" Open module, e.g. :Pyimport os (opens the os module)
" --------------------

" --------------------
"  nerdtreetagbar
" --------------------
let g:NERDTreeWinSize = 20
let g:tagbar_width=20
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" --------------------
" tpope/vim-commentary
" gcc  "comment one line
" gc   " comment out the selection in virtual mode
" gcu " cancel comment
" --------------------
autocmd FileType apache setlocal commentstring=#\ %s


" --------------------
"  vim-fugitive
" 在Vim里面调用Git命令。在vim中实用git命令时要在原本命令前面加上’G’，如”Gcommit”
" --------------------

" --------------------
"  vimim
"  打开Vim,按i进入插入模式，按Ctrl+/切换至中文输入法,然后输入拼音就会有候选词弹窗,输入候选词前面的序号来选中候选词，如果候选词不在第一页，可以通过 Ctrl+n 和 Ctrl+p 来上下翻页,然后按空格来选择候选词,想要关闭 VimIM 输入法,请再按 Ctrl + /
" --------------------

" --------------------
"  NERDTree-Tabs
" let g:nerdtree_tabs_open_on_console_startup=1   "设置打开vim的时候默认打开目录树
" 透過 NERDTree Tabs 開啟檔案，快捷鍵: \t 
" map <leader>t <plug>NERDTreeTabsToggle<CR>
" --------------------

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" --------------------
" nerdcommenter
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
" <leader>cA   在行末加上注释
" <leader>cl <leader>cb 左对齐和左右对其，左右对齐主要针对/**/
" --------------------
let g:NERDSpaceDelims= 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
" 添加新的自定义文件类型,比如打开txt文件后,执行:set ft=txt,然后使用快捷键进行注释
let g:NERDCustomDelimiters = { 
    \ 'dosini': { 'left': '#'}, 
    \ 'txt': { 'left': '#'}, 
    \ 'c': { 'left': '/**','right': '*/' }  
    \ }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
map <F4> <leader>c<space>

" --------------------
" Ack
" --------------------
map <F3> :Ack! -i 

" --------------------
" ctrlp
" --------------------
" let g:ctrlp_map = '<c-f>'
let g:ctrlp_show_hidden = 0
" 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" --------------------
" EasyMotion
" --------------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-overwin-f2)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" --------------------
" fzf
" --------------------
nnoremap <Leader>o :FZF<CR>
let g:fzf_layout = { 'down': '~20%' }

" --------------------
" dash 
" --------------------
map <F8> :Dash<cr>

" --------------------
" tagbar
" --------------------
let g:tagbar_width=30
map  <F12> :TagbarToggle<CR>
map! <F12> <Esc>:TagbarToggle<CR>

" --------------------
"  vim-surround
"  cs'" -> change ' to "   改变包围 
"  ds[ -> delete [ 这个括号 
"  ysiw} --> 将当前词用{}括起来
"  yss + '"{[(    包围一行
"  ysiw + '"{[(    包围单词
" --------------------


" --------------------
"  vim-multiple-cursors
" --------------------
" ctrl+m  选中光标下的单词，连续按会连续选。
" ctrl+p 放弃一个, 回到上一个，
" ctrl+x 跳过当前选中, 选中下一个，esc退出
" 场景： 将光标移动到需要修改的单词，ctrl+n 多次选择，x删除，i开始插入新的单词
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" --------------------
"  vim-airline
" --------------------
let g:airline_theme="molokai"
set laststatus=2
let g:airline_powerline_fonts = 1   

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
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

set hidden    "避免必须保存修改才可以跳转buffer

" buffer快速导航
" nnoremap <Leader>b :bp<CR>
" nnoremap <Leader>f :bn<CR>

" 映射<leader>num到num buffer, using :bd close current buffer.
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" --------------------------
"  terryma/vim-expand-region
" --------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
set t_ti= t_te=
" 搜索忽略大小写
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto add file header
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py 0r /Users/yorkbai/workspace/useful_code/git/dotfiles/vim/.vim/vim_template/vim_header_for_python
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

autocmd BufNewFile *.sh 0r /Users/yorkbai/workspace/useful_code/git/dotfiles/vim/.vim/vim_template/vim_header_for_sh
autocmd BufNewFile *.sh ks|call FileName()|'s
autocmd BufNewFile *.sh ks|call CreatedTime()|'s

fun FileName()
  if line("$") > 10
    let l = 10
  else
    let l = line("$")
  endif
  exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
endfun

fun CreatedTime()
  if line("$") > 10
    let l = 10
  else
    let l = line("$")
  endif
  exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
endfun
" end auto add file header

" 新建文件后,自动定位到文件末尾
autocmd BufNewFile * normal G

" -----------------------
" for solarized theme
" -----------------------
" let g:solarized_termtrans = 1
" colorscheme solarized
" highlight Comment cterm=italic
" hi Visual cterm=NONE ctermbg=White ctermfg=Black
" call togglebg#map("<F6>")

" -----------------------
" for molokai theme
" -----------------------
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
" set background=dark
" highlight Comment cterm=italic
" hi Visual cterm=NONE ctermbg=White ctermfg=Black

" -----------------------
" for tomorrow theme
" -----------------------
colorscheme Tomorrow-Night-Eighties
highlight Comment cterm=italic
hi Visual cterm=NONE ctermbg=White ctermfg=Black

" -----------------------
"  for space-vim-dark theme
" -----------------------
" colorscheme space-vim-dark
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" let g:space_vim_dark_background = 234
" color space-vim-dark
" highlight Comment cterm=italic
" hi Visual cterm=NONE ctermbg=White ctermfg=Black
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" yank text to the OS X clipboard  将文本复制到OSX剪贴板中
noremap <leader>y    "*y
noremap <leader>yy   "*Y"

" Preserve indentation while pasting text from the OS X clipboard  在粘贴OSX剪贴板中的文本时保留缩进, 与下面的限制缩进配置效果相同
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

" 限制大量文本粘贴时的自动缩进,for tmux to automatically set paste and nopaste mode at the time pasting (as happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
     return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start.substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g').tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" 自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" 调整光标形状在不同的模式下
if exists('$ITERM_PROFILE')
    if exists('$TMUX')
         let &t_SI = "\<Esc>[3 q"
         let &t_EI = "\<Esc>[0 q"
    else
         let &t_SI = "\<Esc>]50;CursorShape=1\x7"
         let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
end

" --------------------
" gundo
" --------------------
nnoremap <F6> :GundoToggle<CR>

" --------------------
" quickfix 
" --------------------
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" Automatically quit Vim if quickfix window is the last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
 
" --------------------
"  asyncrun
" --------------------
" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>
augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction


" background color fix
if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=
endif
