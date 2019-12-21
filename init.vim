" vim-plug

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

" theme

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'

" programming

Plug 'sheerun/vim-polyglot'
Plug 'sirver/UltiSnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'plasticboy/vim-markdown'

" latex

Plug 'lervag/vimtex'

" org

Plug 'jceb/vim-orgmode'

" git

Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

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
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class,*.png,*.jpg,*.gif,*.o,.git
set timeoutlen=500
set updatetime=300

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

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

let mapleader=","

colo night-owl

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup filetype_detect_on_rename
        autocmd!
        autocmd BufFilePost * filetype detect
    augroup END
endif

" vim-airline

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "bubblegum"

" UltiSnips

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2

" whick-key

nnoremap <silent> <leader> :WhichKey ','<CR>

" coc.nvim

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <CR> :noh<CR><CR>

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

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" vim-easymotion

let g:EasyMotion_keys = "asdfghjkl"
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" mappings

nmap <leader>pi :PlugInstall<cr>
nmap <leader>pu :PlugUpdate<cr>
nmap <leader>pc :PlugClean<cr>

nmap <leader>gs :Magit<cr>

nmap <leader>bb :Buffers<cr>
nmap <leader>bk :bdelete<cr>

nmap <leader>ff :Files<cr>
nmap <leader>fi :e ~/.config/nvim/init.vim<cr>

nmap <leader>wh <C-w>h
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wl <C-w>l

command W :w
command Q :q
command Wq :wq
