""""""""""""""""""""
" 插件配置
"""""""""""""""""""

call pathogen#infect()
syntax on
filetype plugin indent on


""""""""""""""""""
" 基础配置选项
""""""""""""""""""

set number


""""""""""""
" 键位映射
""""""""""""

" F2 设置行号
noremap <F2> :set number!<CR>"

" F9 显示可打印字符开关
nnoremap <F9> :set list! list?<CR>
