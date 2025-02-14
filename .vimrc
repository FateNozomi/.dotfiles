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

nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>n :noh<cr>
nmap <leader>w :w!<cr>
nmap <leader>t :bo term<cr>
nmap <leader>- :E<cr>

nmap <leader>y "+Y
vmap <leader>y "+y
nmap <leader>p "+p

" ::tabo -> :tabo
norea <expr> tabo getcmdtype() == ':' && getcmdline() == 'tabo' ? 'tabp' : 'tabo'

if has('termguicolors')
  set termguicolors
endif

packadd! gruvbox-material
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:lightline={'colorscheme':'gruvbox_material'}

if has("gui_running")
  set guifont=Cascadia\ Mono:h11
  set lines=38
  set columns=100
  set guioptions-=T
  set guioptions-=e
  set shell=pwsh
endif

" Visual Studio
map gi :vsc Edit.GoToImplementation<cr>
map gr :vsc Edit.FindAllReferences<cr>
