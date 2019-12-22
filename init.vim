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
set t_Co=256
set whichwrap+=<,>,h,l
set ttimeoutlen=0
set re=1
set lazyredraw
set regexpengine=1
set synmaxcol=128
" set backspace=indent,eol,start
set mouse=a
set laststatus=2        "始终显示状态栏
set wildmenu             " vim 自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在 vim 之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set signcolumn=yes      " 防止coc错误标记导致左边栏忽宽忽窄

if has('autocmd')
	filetype plugin indent on
endif

if has('syntax')  
	syntax enable 
	syntax on 
    syntax sync minlines=256
endif

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"中文编码
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

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
    Plug 'ntpeters/vim-better-whitespace'
    
    " Useful
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'           "startify page
    Plug 'chxuan/prepare-code'          "新建文件时，生成预定义代码片段
    Plug 'scrooloose/nerdcommenter'     "快速注释插件
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
    " Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat'  }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'voldikss/vim-floaterm'
    " Plug 'sillybun/vim-repl'
    Plug 'Lenovsky/nuake'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
    " Plug 'kristijanhusak/defx-icons'

    " Python
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins','for': 'python' }
    Plug 'skywind3000/asyncrun.vim', {'for': 'python'}
    Plug 'tweekmonster/braceless.vim', {'for': 'python'}
    " Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug']  }
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

" 复制当前选中到系统剪切板
vmap Y "+y

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>
inoremap <c-d> <del>

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
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

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

" prepare-code
let g:prepare_code_plugin_path = expand($VIM . "/plugged/prepare-code")


""""""""""
"  defx  "
""""""""""
" nnoremap <silent> <Leader>l
" \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent> <Leader>a
" \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

" function! s:defx_mappings() abort
"     " Defx window keyboard mappings
"     setlocal signcolumn=no
"     " 使用回车打开文件
"     nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
" endfunction

" call defx#custom#option('_', {
"     \ 'columns': 'indent:git:icons:filename',
"     \ 'winwidth': 25,
"     \ 'split': 'vertical',
"     \ 'direction': 'topleft',
"     \ 'listed': 1,
"     \ 'show_ignored_files': 0,
"     \ 'root_marker': '≡ ',
"     \ 'ignored_files':
"     \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
"     \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
"     \ })

" autocmd FileType defx call s:defx_mappings()

""""""""""""""""
"  easymotion  "
""""""""""""""""
" map <Leader> <Plug>(easymotion-prefix)

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

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:current_line_whitespace_disabled_soft=1
let g:strip_max_file_size = 1000
let g:strip_whitespace_confirm=0
autocmd FileType python EnableStripWhitespaceOnSave
