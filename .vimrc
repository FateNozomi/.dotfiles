let mapleader = " "

set number

set expandtab
set smartindent
set tabstop=2
set shiftwidth=2

set hlsearch
set ignorecase
set smartcase

set list
set listchars=tab:»\ ,trail:·,nbsp:␣

set cursorline

set scrolloff=10

set laststatus=2
set ruler

syntax enable
filetype plugin indent on

" ::tabo -> :tabo
norea <expr> tabo getcmdtype() == ':' && getcmdline() == 'tabo' ? 'tabp' : 'tabo'

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark='soft'
silent! colorscheme gruvbox

if has("gui_running")
  set guifont=Cascadia\ Mono:h11
  set lines=38
  set columns=100
  set guioptions-=T
  set guioptions-=e
endif

nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>n :noh<cr>
nmap <leader>w :w!<cr>
nmap <leader>t :bo term<cr>
nmap <leader>- :E<cr>

nmap <leader>y "+Y
vmap <leader>y "+y
nmap <leader>p "+p

nmap <C-p> :Files<cr>

" Visual Studio
map gi :vsc Edit.GoToImplementation<cr>
map gr :vsc Edit.FindAllReferences<cr>
