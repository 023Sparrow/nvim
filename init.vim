""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Config                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set <LEADER> as <SPACE>
let mapleader = " "
set termguicolors "设置真彩
set nu
set relativenumber "相对行号
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
set synmaxcol=128
syntax sync minlines=256
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
filetype on
syntax on
autocmd FileType json syntax match Comment +\/\/.\+$+   "高亮json文件
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
set tags="C://WINDOWS//system32//ctags.exe"
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
    " Plug 'liuchengxu/eleline.vim'       "vim状态栏
    Plug 'taigacute/spaceline.vim'
    Plug 'Yggdroot/indentLine'          "缩进线
    Plug 'kien/rainbow_parentheses.vim' "彩虹括号
    " Plug 'ryanoasis/vim-devicons'
    
    " Useful
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'           "startify page
    Plug 'chxuan/prepare-code'          "新建文件时，生成预定义代码片段
    Plug 'scrooloose/nerdcommenter'     "快速注释插件
    Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/vim-slash'
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat'  }
    " Plug 'sillybun/vim-repl'
    " Plug 'Lenovsky/nuake'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
    " Plug 'kristijanhusak/defx-icons'
    " Plug 'liuchengxu/vista.vim'

    " Python
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
    Plug 'skywind3000/asyncrun.vim'
    Plug 'tweekmonster/braceless.vim'
    
    " Markdown
    " Plug 'plasticboy/vim-markdown'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'   }
    " Plug 'iamcco/mathjax-support-for-mkdp'

    call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plug Config                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gruvbox_italic=1
" colorscheme gruvbox
" colorscheme one
" set background=dark
" let g:one_allow_italics = 1
let g:seoul256_background = 234
colo seoul256

"调试python
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

"eleline状态栏
"启用powerline字体
" let g:eleline_powerline_fonts = 1
let g:spaceline_seperate_style= 'arrow-fade'

"彩色括号
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['black', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]
let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

"缩进线
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

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

" Indentation
nnoremap < <<
nnoremap > >>

" tabular
nnoremap <leader>= :Tab /=<cr>

"代码格式化
nnoremap <leader><leader>= :0,$!yapf<CR>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>


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


""""""""""""""
"  floaterm  "
""""""""""""""
" F12在当前文件目录下呼出终端
noremap  <silent> <F12>           :FloatermToggle<CR>i
noremap! <silent> <F12>           <Esc>:FloatermToggle<CR>i
tnoremap <silent> <F12>           <C-\><C-n>:FloatermToggle<CR>

" Braceless
autocmd FileType python BracelessEnable +indent

let g:python_highlight_all = 1


"""""""""
"  FZF  "
"""""""""
" nnoremap <C-F>      :FZF<CR>
" nnoremap <Leader>ff :Files<CR>
" nnoremap <Leader>fb :Buffers<CR>
" nnoremap <Leader>fc :Colors<CR>
" nnoremap <Leader>fh :History<CR>
" nnoremap <Leader>fl :Lines<CR>
" nnoremap <Leader>fm :Commands<CR>


"""""""""""
"  Vista  "
"""""""""""
" function! NearestMethodOrFunction() abort
"       return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" noremap  <silent> <F11>           :Vista<CR>
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_default_executive = 'ctags'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
"             \   "function": "\uf794",
"             \   "variable": "\uf71b",
"             \  }



"""""""""""""""
"  Ultisnips  "
"""""""""""""""
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"


""""""""""""""""""""""
"  Markdown-preview  "
""""""""""""""""""""""
" let g:mkdp_echo_preview_url = 1
" let g:mkdp_browser = "C://Program Files (x86)//Google//Chrome//Application//chrome.exe"
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop

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

autocmd FileType defx call s:defx_mappings()

""""""""""""""""
"  easymotion  "
""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

"""""""""""
"  Nuake  "
"""""""""""
" nnoremap <F12> :Nuake<CR>
" inoremap <F12> <C-\><C-n>:Nuake<CR>
" tnoremap <F12> <C-\><C-n>:Nuake<CR>

"""""""""""""""
"  vim-slash  "
"""""""""""""""
noremap <plug>(slash-after) zz

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" Repl
" nnoremap <leader>r :REPLToggle<Cr>
" let g:repl_program = {
"             \'python': 'ipython',
"             \'default': 'pwsh'
"             \}

" Startify
" let g:startify_lists = [
"         \ { 'type': 'files',     'header': ['   MRU']            },
"         \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
"         \ { 'type': 'sessions',  'header': ['   Sessions']       },
"         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"         \ { 'type': 'commands',  'header': ['   Commands']       },
"         \ ]
let g:startify_bookmarks = [{'E': '$HOME\AppData\Local\nvim\init.vim'},{'F': '$HOME\AppData\Local\nvim\ginit.vim'}]

" prepare-code
let g:prepare_code_plugin_path = expand($VIM . "/plugged/prepare-code")
