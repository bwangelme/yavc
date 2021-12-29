" vim: set ts=4 sw=4 tw=78 noet :

""""""""""""""""""""
" 插件配置
"""""""""""""""""""

call pathogen#infect()
syntax on

""""""""""""""""""
" 基础配置
""""""""""""""""""

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
    " 内部工作编码
    set encoding=utf-8

    " 文件默认编码
    set fileencoding=utf-8

    " 打开文件时自动尝试下面顺序的编码
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

    " 下面这句只影响普通模式 (非图形界面) 下的 Vim
    set termencoding=utf-8
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
    filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')
    syntax enable
    syntax on
endif

"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" ex模式下补全的方式
set wildmode=list:longest
" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
    " 允许代码折叠
    set foldenable

    " 代码折叠默认使用缩进
    set fdm=indent

    " 默认打开所有缩进
    set foldlevel=99
endif

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**

""""""""""""
" 键位映射
""""""""""""

" 修改leader按键
let mapleader = ' '
let g:mapleader = ' '

"----------------------------------------------------------------------
" 普通模式的按键映射
"----------------------------------------------------------------------
noremap H ^
noremap L $
" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '
" 将U映射成<C-r>
nnoremap U <C-r>
" 文件折叠
nmap - zc
nmap + zo
nmap <leader>s :w<CR>

nnoremap <D-[> <C-O>
nnoremap <D-]> <C-I>

" 获取当前位置作为断点
function! GetBreakPoint()
    let @" = expand("%").":".line(".")
    echo @"
endfunction

nmap <leader>b :call GetBreakPoint()<CR>

" 复制选中区到系统剪切板中
if has('clipboard')
    vnoremap y "+y
    map Y "+y$
else
    map Y y$
endif

"----------------------------------------------------------------------
" Visual 模式的按键映射
"----------------------------------------------------------------------
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

"----------------------------------------------------------------------
" 分屏窗口移动, Smart way to move between windows
"----------------------------------------------------------------------
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-v> <C-w>v
nnoremap <C-c> <C-w>c
nnoremap <C-s> <C-w>s


"----------------------------------------------------------------------
" INSERT 模式下按键映射
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>
" 插入模式下将小写字母转换成大写字母, I love this very much
inoremap <C-y> <esc>gUiwea
" 详见：http://www.skywind.me/blog/archives/2021
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"----------------------------------------------------------------------
" 命令模式的按键映射
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>
" ctrl-n, ctrl-p 只能搜索历史命令
cnoremap <c-n> <down>
cnoremap <c-p> <up>
" 将%:h映射为%%，%:h的功能是显示当前缓冲区文件的绝对路径
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'
" 在命令窗口中执行命令后重新打开
autocmd CmdwinEnter * map <buffer> <F5> <CR>q:

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 进入搜索Use sane regexes"
nnoremap / /\m
vnoremap / /\m
" 让搜索内容始终在屏幕中间
nnoremap <silent> n n
nnoremap <silent> N N
nnoremap <silent> * #Nzz
nnoremap <silent> # *Nzz
nnoremap <silent> g* g*zz

"----------------------------------------------------------------------
" FN 按键映射
"----------------------------------------------------------------------

" F1 设置行号
noremap <F1> :set number!<CR>"

" F2 折叠开关
function! ToggleFold()
    if(&foldlevel == '0')
        exec "normal! zR"
    else
        exec "normal! zM"
    endif
    echo "foldlevel:" &foldlevel
endfunction
nnoremap <F2> :call ToggleFold()<CR>


" F9 显示可打印字符开关
nnoremap <F9> :set list! list?<CR>

" F3 打开导航窗口
noremap <F3> :NERDTreeToggle<CR>

" F5 插入模式下的粘贴开关
set pastetoggle=<F5>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


""""""""""""""""""
" GUI 设置
""""""""""""""""""

" 设置颜色主题
if has('gui')
	colorscheme seoul256
endif

" 总是显示行号
set number

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
" set signcolumn=yes

" 总是显示标签栏
" set showtabline=2

" 右下角显示命令
set showcmd

" 水平切割窗口时，默认在右边显示新窗口
set splitright

" 突出显示当前列
" set cursorcolumn
" 突出显示当前行
" set cursorline
" 设置80行提示线
" set colorcolumn=80

"----------------------------------------------------------------------
" 状态栏设置
"----------------------------------------------------------------------
" 总是显示状态栏
set laststatus=2

" statusline说明
"
" %{}: {}中可以存放一个表达式
" \ : 空格

set statusline=%f
" %<: 如果内容被截断，前面用<填充
" %f: buffer中的文件路径
set statusline+=%<
" %m: 修改标记[+]，如果'modifiable'选项关闭的话是[-]
" %r: 只读标记[RO]
" %w: 预览窗口标记[Preview]
" %h: 帮助Buffer的标记[help]
" %y: Buffer中文件的类型，例如[vim]
set statusline+=\ %m%r%w%h%y
" %l: 当前行号 %c: 当前列号，特殊字符算作一列，中文算作三列
set statusline+=\ %(%l,%c%)
" %P: 文档阅读百分比 %L: 文档总行数
set statusline+=\ %P-%L
" %n: Buffer序号
set statusline+=\ \<%n\>
" %B: 光标下字符的十六进制编码值
set statusline+=\ %B

" %=: 左右对齐项目的分割点
set statusline+=\ %=

"  (&fenc==\"\")?&enc:&fenc: fileencoding表示Buffer中打开的文件编码，encoding表
" 示vim使用的文件编码，默认显示fileencoding
"  (&bomb?\",BOM\":\"\"): 检查当前文件中是否含有BOM标记
"  > BOM标记是一个二进制标记符，用来表示字节流的编码标号或字节序,参考
"  > https://zh.wikipedia.org/wiki/%E4%BD%8D%E5%85%83%E7%B5%84%E9%A0%86%E5%BA%8F%E8%A8%98%E8%99%9F
set statusline+=[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
" %{fugitive#statusline()}: 利用tpope/vim-fugitive插件获取当前Git分支
set statusline+=\ %{(exists('g:loaded_fugitive')?fugitive#statusline():'')}

""""""""""""""""""
" 其他配置
""""""""""""""""""

"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 备份文件地址，统一管理
set backupdir=~/.vim/tmp

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
" set noswapfile

" 禁用 undo文件
set noundofile

" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)


""""""""""""""""""
" 插件
""""""""""""""""""

"----------------------------------------------------------------------
" EasyMontion
"----------------------------------------------------------------------

let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
" 重复上一次操作, 类似repeat插件, 很强大
map <leader>. <Plug>(easymotion-repeat)


"----------------------------------------------------------------------
" ripgrep
"----------------------------------------------------------------------

nnoremap <Leader>q :Rg<Space>
xnoremap <silent> <Leader>q y:Rg <C-R>"<CR>
