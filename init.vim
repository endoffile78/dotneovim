filetype off
call plug#begin('~/.config/nvim/bundle')

" general

Plug 'tpope/vim-commentary'
Plug 'tmsvg/pear-tree'
Plug 'liuchengxu/vim-which-key'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-cool'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'
Plug 'farmergreg/vim-lastplace'
Plug 'jremmen/vim-ripgrep'
Plug 'justinmk/vim-sneak'
Plug 'vimlab/split-term.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

" theme

Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'

" programming

Plug 'sirver/UltiSnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'rhysd/vim-clang-format'
Plug 'AndrewRadev/splitjoin.vim'

" writing

Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
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
set relativenumber
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
set listchars=tab:»\ ,trail:.,extends:>,precedes:<,nbsp:·
set list

set guifont=Iosevka:12
set undofile
set textwidth=72

" completion

set complete-=i
set wildmode=list:longest,list:full
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

colorscheme PaperColor

let mapleader="\<space>"
let maplocalleader="\<space>m"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup filetype_detect_on_rename
    autocmd!
    autocmd BufFilePost * filetype detect
augroup END

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

let g:coc_global_extensions = ["coc-go", "coc-python", "coc-json", "coc-snippets",
                            \ "coc-vimtex", "coc-clangd", "coc-rls"]

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

" rainbow

let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['lightblue', 'yellow', 'lightgreen', 'lightcyan',  'lightmagenta']
            \ }

" sandwhich

runtime macros/sandwich/keymap/surround.vim

" vim-json

let g:vim_json_syntax_conceal = 0

" vimtex

let g:tex_flavor="latex"
let g:vimtex_view_method="zathura"
let g:vimtex_compiler_method="latexmk"

if (has("nvim"))
    let g:vimtex_compiler_progname="nvr"
endif

" vim-jsx-pretty

let g:vim_jsx_pretty_highlight_close_tag = 1

" markdown

let g:vim_markdown_folding_disabled = 1

" rust.vim

let g:rustfmt_autosave = 1

" clang-format

let clang_format#detect_style_file = 1
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable

" pear-tree

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" vim-sneak

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" airline

let g:lightline = { 'colorscheme': 'PaperColor' }

" mappings

nmap <silent> <leader><space> :Commands<cr>

nmap <leader>gg :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>

nmap <leader>bb :Buffers<cr>
nmap <leader>bk :bdelete<cr>

nmap <leader>ff :Files<cr>
nmap <leader>fr :History<cr>
nmap <leader>fi :e ~/.config/nvim/init.vim<cr>

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

nmap <silent> <leader>ot :Term<cr>

" Emacs keybindings

nmap <silent> <M-x> :Commands<cr>

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

" terminal

autocmd TermOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
autocmd TermOpen term://* startinsert
function TerminalCommands()
    set nonumber
    set signcolumn=no
endfunction
