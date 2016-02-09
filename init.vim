" vim-plug

filetype off
call plug#begin('~/.config/nvim/bundle')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/a.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'bling/vim-airline'
Plug 'endoffile78/ir_black'
Plug 'tpope/vim-scriptease'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'sirver/UltiSnips'
Plug 'lambdalisue/vim-gita'

if has("nvim")
	Plug 'benekastah/neomake'
else
	Plug 'scrooloose/syntastic'
endif

call plug#end()

filetype plugin indent on
syntax on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set number
set nowrap
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nosmartindent
set mouse=a
set showmatch
set showcmd
set background=dark
set hlsearch
set ruler
set ttyfast
set splitright
set splitbelow
set matchtime=2
set backspace=indent,eol,start
set lazyredraw
set cursorline
set laststatus=2
set incsearch
set hidden
set binary
set pastetoggle=<F10>
set smarttab
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set wildignore=*.swp,*.bak,*.pyc,*.class,*.png,*.jpg,*.gif,*.o
set t_Co=256
set noerrorbells
set novisualbell
set vb t_vb=

let mapleader=","

colo ir_black

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	augroup filetype_detect_on_rename
		autocmd!
		autocmd BufFilePost * filetype detect
	augroup END
endif

" Neomake

if has("nvim")
	autocmd BufWritePost * Neomake
	let g:neomake_python = ['pyflakes']
	let g:neomake_open_list = 2
else
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_python_checkers = ['pyflakes']
endif

" vim-airline

let g:airline#extensions#tabline#enabled = 1

" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" UltiSnips

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2

" mappings

map <C-a> :AT<cr>
map <leader>q :tabclose<cr>
map <leader>t :tabnew<cr>
map <leader>c :noh<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr> 
nmap <leader>m :make<cr>
vmap <C-c> "+y
nmap <leader>l :ls<cr>
nmap <leader>hi :HeaderIncrease<cr>
nmap <leader>hd :HeaderDecrease<cr>
nmap <leader>u :UltiSnipsEdit<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pu :PlugUpdate<cr>
nmap <leader>pc :PlugClean
nmap <leader>ps :PlugStatus
nmap <leader>gs :Gita status<cr>
nmap <leader>gb :Gita blame<cr>

if has('nvim')
	tnoremap <a-j> <C-\><C-n><C-w>j
	tnoremap <a-k> <C-\><C-n><C-w>k
	tnoremap <a-h> <C-\><C-n><C-w>h
	tnoremap <a-l> <C-\><C-n><C-w>l
	au WinEnter *pid:* call feedkeys('i')
endif
