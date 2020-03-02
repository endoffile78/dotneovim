filetype off
call plug#begin('~/.config/nvim/bundle')

" general

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-cool'
Plug 'ryvnf/readline.vim'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'
Plug 'conweller/findr.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'svermeulen/vim-yoink'
Plug 'jremmen/vim-ripgrep'
Plug 'PeterRincker/vim-argumentative'

" theme

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hzchirs/vim-material'
Plug 'vim-scripts/Fruidle'

" programming

Plug 'sirver/UltiSnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'axvr/zepl.vim'

" writing

Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" git

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" tmux

Plug 'christoomey/vim-tmux-navigator'

" fun

Plug 'koron/nyancat-vim'

call plug#end()

filetype plugin indent on
syntax on

" general

set mouse=a
set noshowmode
set background=dark
set ruler
set nocompatible
set autoread
set number
set nowrap
set cursorline
set noerrorbells
set novisualbell
set title
set splitright
set splitbelow
set backspace=indent,eol,start
set lazyredraw
set hidden
set pastetoggle=<F10>
set timeoutlen=500
set updatetime=300
set autochdir
set eol
set clipboard=unnamed
set signcolumn=yes
set fsync

" completion

set complete-=i
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak,*.pyc,*.class,*.png,*.jpg,*.gif,*.o,.git,.svn,.hg

" encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" indentation

set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" searching

set incsearch
set ignorecase
set hlsearch
set showmatch

if (executable("rg"))
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" theme

if (has("termguicolors"))
    set termguicolors
endif

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

let g:themes = ['vim-material', 'fruidle']
fun! ToggleColorscheme()
    let color = filter(copy(g:themes), {k,v-> v != g:colors_name})[0]
    exe "colorscheme ".color
endf

exe "colorscheme ".g:themes[0]

let mapleader="\<space>"
let maplocalleader="\<space>\<space>"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup filetype_detect_on_rename
    autocmd!
    autocmd BufFilePost * filetype detect
augroup END

" vim-airline

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "bubblegum"

" UltiSnips

let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsUsePythonVersion = 3

" whick-key

nnoremap <silent> <leader> :WhichKey ' '<CR>

" coc.nvim

let g:coc_global_extensions = ["coc-go", "coc-python", "coc-ccls", "coc-json", "coc-snippets", "coc-vimtex"]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> K :call CocActionAsync('doHover')<cr>

nmap <silent> <leader>d :<C-u>CocList diagnostics<cr>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

command! -nargs=0 Format :call CocAction('format')

" echodoc

let g:echodoc_enable_at_startup = 1

" vim-go

let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_def_mode="gopls"
let g:go_info_mode="gopls"
let g:go_def_mapping_enabled = 0

" better-whitespace

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" vim-easymotion

let g:EasyMotion_keys = "asdfghjkl"
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
map t <Plug>(easymotion-tl)
map T <Plug>(easymotion-Tl)

" rainbow

let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['lightblue', 'yellow', 'lightgreen', 'lightcyan',  'lightmagenta']
            \ }

" sandwhich

runtime macros/sandwich/keymap/surround.vim

" vim-json

let g:vim_json_syntax_conceal = 0

" vim-yoink

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" vimtex

let g:tex_flavor="latex"
let g:vimtex_view_method="zathura"
let g:vimtex_compiler_method="latexmk"

if (has("nvim"))
    let g:vimtex_compiler_progname="nvr"
endif

" findr

let g:findr_floating_window = 0

" vim-jsx-pretty

let g:vim_jsx_pretty_highlight_close_tag = 1

" zpepl

augroup zepl
    autocmd!
    autocmd FileType python     let b:repl_config = { 'cmd': 'python3' }
    autocmd FileType javascript let b:repl_config = { 'cmd': 'node' }
    autocmd FileType clojure    let b:repl_config = { 'cmd': 'clj' }
augroup END

nmap gz :Repl<cr>

" mappings

nmap <leader>pi :PlugInstall<cr>
nmap <leader>pu :PlugUpdate<cr>
nmap <leader>pc :PlugClean<cr>

nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>

nmap <leader>bb :FindrBuffers<cr>
nmap <leader>bk :bdelete<cr>

nmap <leader>ff :Findr<cr>
nmap <leader>fr :browse oldfiles<cr>
nmap <leader>fi :e ~/.config/nvim/init.vim<cr>

nnoremap <silent> <leader>tc :call ToggleColorscheme()<CR>

nmap <leader>wh <C-w>h
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wl <C-w>l
nmap <silent> <leader>wv :vsplit<cr>
nmap <silent> <leader>ws :split<cr>
nmap <leader>w0 <C-w>o
nmap <leader>wo <C-w>w
nmap <leader>w1 <C-w>q
nmap <leader>wc <C-w>q
nmap <leader>wq <C-w>q

nmap <leader>/ :Rg

" Emacs keybindings

nnoremap <C-g> <esc>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Useful abbreviations

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
