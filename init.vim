""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Config                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set <LEADER> as <SPACE>
let mapleader = " "
set nocompatible
set autochdir
set nu
set hlsearch
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set complete-=i
set t_Co=256
set whichwrap+=<,>,h,l
set re=1
set lazyredraw
set regexpengine=1
set synmaxcol=128
" set backspace=indent,eol,start
set laststatus=2        "始终显示状态栏
set wildmenu             " vim 自身命名行模式智能补全
set completeopt=noinsert,menuone,noselect
set signcolumn=yes      " 防止coc错误标记导致左边栏忽宽忽窄
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在 vim 之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set display+=lastline
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

set runtimepath^=$VIM/plugged/coc.nvim

filetype plugin indent on
syntax on 
set hidden
syntax sync minlines=256

if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

if !&scrolloff
    set scrolloff=3
endif
if !&sidescrolloff
    set sidescrolloff=5
endif


" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif


" 编码与中文
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" Use Unix as the standard file type
set ffs=unix,dos,mac
" 合并两行中文时，不在中间加空格
set formatoptions+=B


""""""""""""
"  Python  "
""""""""""""
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" 定义函数AutoSetFileHead，自动插入文件头
" autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'python'
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif
endfunc
map <F11> :call AutoSetFileHead()<CR>


" Some key files location
" set tags="C://WINDOWS//system32//ctags.exe"
" 指定Python3位置
let g:python3_host_skip_check=1
let g:python3_host_prog="C://Users//flamech//AppData//Local//Programs//Python//Python37//python"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Plug                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$VIM/plugged')

    "美化
    " Plug 'morhetz/gruvbox'
    " Plug 'rakr/vim-one'
    " Plug 'junegunn/seoul256.vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'liuchengxu/eleline.vim'       "vim状态栏
    Plug 'Yggdroot/indentLine', {'for': 'python'}
    Plug 'frazrepo/vim-rainbow', {'for': 'python'}
    
    " Useful
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'           "startify page
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'Yggdroot/LeaderF', {'do': '.\install.bat'}
    " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'voldikss/vim-floaterm'
    " Plug 'Lenovsky/nuake', {'on': 'Nuake'}
    Plug 'voldikss/vim-floaterm'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " Python
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins','for': 'python' }
    Plug 'skywind3000/asyncrun.vim', {'for': 'python'}
    Plug 'tweekmonster/braceless.vim', {'for': 'python'}
    Plug 'Guzzii/python-syntax', {'for' :'python'}
    
    call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plug Config                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""
"  Mapping  "
"""""""""""""

"编辑vimrc
nnoremap <leader>e :edit $MYVIMRC<cr>
"重新加载vimrc
nnoremap <leader>s :source $MYVIMRC<cr>
" 快速退出、保存、关闭
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>b :bd<cr>
" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" y$ -> Y Make Y behave like other capitals
map Y y$
" 复制选中区到系统剪切板中
vnoremap <leader>y "+y
" Search
noremap <LEADER><CR> :nohlsearch<CR>
" Indentation
nnoremap < <<
nnoremap > >>
" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>
inoremap <c-d> <del>
" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" python 代码格式化
nnoremap <leader><leader>= :0,$!yapf<CR>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>


"""""""""""
"  Color  "
"""""""""""
set termguicolors
" let g:seoul256_background = 234
" colo seoul256
" Terminal Background
let g:jellybeans_overrides = {
            \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
            \}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
let g:jellybeans_use_term_italics = 1
colo jellybeans


""""""""""""""""""
"  禁止内置插件  "
""""""""""""""""""
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1


"" 调试python
nnoremap <F10> :call CompileRunGcc()<cr>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        if search("@profile")
            exec "AsyncRun kernprof -l -v %"
            exec "copen"
            exec "wincmd p"
        elseif search("set_trace()")
            exec "!python %"
        else
            exec "AsyncRun -raw python %"
            exec "copen"
            exec "wincmd p"
        endif
    endif
endfunc

" eleline
let g:eleline_powerline_fonts = 1


"彩色括号
au FileType python call rainbow#load()


"缩进线
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1


" Braceless
autocmd FileType python BracelessEnable +indent
let g:python_highlight_all = 1


"""""""""""""
"  LeaderF  "
"""""""""""""
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" Startify
let g:startify_bookmarks = [{'F': '$HOME\AppData\Local\nvim\ginit.vim'}]
" Open Startify
noremap <LEADER>st :Startify<CR>

" floaterm
let g:floaterm_keymap_toggle = '<F12>'

"semshi
let g:semshi#update_delay_factor=0.0001

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""
"  Coc  "
"""""""""
set updatetime=300
set shortmess+=c
