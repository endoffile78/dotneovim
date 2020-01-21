filetype off
call plug#begin('~/.config/nvim/bundle')

" general

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-eunuch'
Plug 'ryvnf/readline.vim'
Plug 'liuchengxu/vim-clap'
Plug 'dstein64/vim-win'
Plug 'luochen1990/rainbow'

" theme

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

" programming

" Plug 'sheerun/vim-polyglot'
Plug 'sirver/UltiSnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" writing

Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'plasticboy/vim-markdown'

" git

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

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

if (has("termguicolors"))
    set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader=","

colo onedark

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

nnoremap <silent> <leader> :WhichKey ','<CR>

" coc.nvim

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" echodoc

let g:echodoc_enable_at_startup = 1

" vim-go

let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

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

" rainbow

let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['lightblue', 'yellow', 'lightgreen', 'lightcyan',  'lightmagenta']
            \ }

" mappings

nmap <leader>pi :PlugInstall<cr>
nmap <leader>pu :PlugUpdate<cr>
nmap <leader>pc :PlugClean<cr>

nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>

nmap <leader>bb :Clap buffers<cr>
nmap <leader>bk :bdelete<cr>

nmap <leader>ff :Clap files<cr>
nmap <leader>fi :e ~/.config/nvim/init.vim<cr>

nmap <leader>wv :vsplit<cr>
nmap <leader>ws :split<cr>

command W :w
command Q :q
command Wq :wq
