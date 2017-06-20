#How to Install

#Plugin List
##自定义前缀
    " 定义快捷键的前缀，即<Leader>
    let mapleader=";"

- 对齐插件: Plug 'junegunn/vim-easy-align'
    vmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

    使用： 进入虚拟模式选择需中对齐的行，按<leader>a 激发插件。默认vim的<leader>键是反斜杠, 可在.vimrc文件中用下行进行自定义设置
     vipga=  (按=号对齐)
     gaip=

- json插件：plug 'axiaoxin/vim-json-line-format'
  Open a file in Normal mode, move your cursor on the json line, use <leader>pj to show formated json by print it, use <leader>wj could change the text to formatted json.

- ctrlp搜索插件
  1.打开VIM之后，首先"cd 【path】"，然后再在此路径中使用CtrlP，就可以一直保持路径为当前路径了
  2.使用 :ctrlp 或ctrl+p快捷键调出，ctrl+j/k上下移动，ctrl+x/v/t打开
- vim-surround插件
  1. cs'"   替换'为"
  2. ds'    删除'
  3. ysiw]  当前text对象用］括起来
  
- nerdcommenter
  let g:NERDCustomDelimiters = {
    \ 'txt': { 'left': '#'}
    \ }
  打开文件，执行  :set ft=txt , 然后用;cc 即可注释

- easymotion 快速移动插件
      <leader><leader>w   -> 默认两次<leader>键激活,w 光标之后查找单词
      <leader><leader>b   -> 默认两次<leader>键激活,f光标之前查找单词
      <leader><leader>f   -> 默认两次<leader>键激活,f表示单个字符
- vim-multiple-cursors 多行操作
     ctrl+n  选中光标下的单词，连续按会连续选。
     ctrl+p 放弃一个, 回到上一个，
     ctrl+x 跳过当前选中, 选中下一个，esc退出
     场景： 修改部分单词
         将光标移动到需要修改的单词，ctrl+n 多次选择， x删除，i开始插入新的单
- vimim 输入中文
  快捷键: ctrl+/

