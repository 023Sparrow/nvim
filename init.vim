""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Config                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set <LEADER> as <SPACE>
let mapleader = " "
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
" set mouse=a
set laststatus=2        "始终显示状态栏
set wildmenu             " vim 自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在 vim 之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set signcolumn=yes      " 防止coc错误标记导致左边栏忽宽忽窄
set display+=lastline
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

if has('autocmd')
	filetype plugin indent on
endif

if has('syntax')  
	syntax enable 
	syntax on 
    syntax sync minlines=256
endif

if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

set formatoptions+=j " Delete comment character when joining commented lines

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


" python 专属配置
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
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'python'
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif
    normal G
    normal o
endfunc
map <F11> :call AutoSetFileHead()<CR>


" Avoid conflict for coc
set hidden
set nowritebackup
" set cmdheight=2
set updatetime=300
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Some key files location
" set tags="C://WINDOWS//system32//ctags.exe"
let g:python3_host_skip_check=1
let g:python3_host_prog="C://Users//flamech//AppData//Local//Programs//Python//Python37//python"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Plug                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('$VIM/plugged')

    "美化
    " Plug 'morhetz/gruvbox'
    " Plug 'rakr/vim-one'
    Plug 'junegunn/seoul256.vim'
    Plug 'liuchengxu/eleline.vim'       "vim状态栏
    Plug 'Yggdroot/indentLine'          "缩进线
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'ryanoasis/vim-devicons'
    
    " Useful
    Plug 'tmsvg/pear-tree'
    Plug 'mhinz/vim-startify'           "startify page
    Plug 'scrooloose/nerdcommenter'     "快速注释插件
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat'  }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'voldikss/vim-floaterm'
    " Plug 'sillybun/vim-repl'
    Plug 'Lenovsky/nuake'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Python
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins','for': 'python' }
    Plug 'skywind3000/asyncrun.vim', {'for': 'python'}
    Plug 'tweekmonster/braceless.vim', {'for': 'python'}
    Plug 'Guzzii/python-syntax', {'for' :'python'}
    
    call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plug Config                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""按键映射"""

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
"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
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

"代码格式化
nnoremap <leader><leader>= :0,$!yapf<CR>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" color
set termguicolors
let g:seoul256_background = 234
colo seoul256

" 禁止内置插件
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
" Activation based on file type
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,python,scheme RainbowParentheses
augroup END
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]

"缩进线
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1


"""""""""""""""""""
"  Nerdcommenter  "
"""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDToggleCheckAllLines = 1


"""""""""
"  Coc  "
"""""""""
"Improve the completion experience
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Make <tab> used for trigger completion, completion confirm, snippet expand
" and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

" coc延迟启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
        exec "CocStart"
    endfunction
    call timer_start(500,'CocTimerStart',{'repeat':1})

" Braceless
autocmd FileType python BracelessEnable +indent
let g:python_highlight_all = 1

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" Startify
let g:startify_bookmarks = [{'E': '$HOME\AppData\Local\nvim\init.vim'},{'F': '$HOME\AppData\Local\nvim\ginit.vim'}]
" Open Startify
noremap <LEADER>st :Startify<CR>


"""""""""""
"  Nuake  "
"""""""""""
nnoremap <F12> :Nuake<CR>
inoremap <F12> <C-\><C-n>:Nuake<CR>
tnoremap <F12> <C-\><C-n>:Nuake<CR>

"semshi
let g:semshi#update_delay_factor=0.0001

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
