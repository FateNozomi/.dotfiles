let mapleader = " "
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>n :noh<cr>
nmap <leader>w :w!<cr>
nmap <C-c> :%y+<cr>
vmap <C-c> "+y
nmap <leader>v "+p
nmap <leader>c :w !clip.exe<cr>
vmap <leader>c :w !clip.exe<cr>
nmap <leader>t :bo term<cr>
nmap <leader>- :E<cr>

set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set hlsearch

set number

filetype plugin indent on
syntax enable
set laststatus=2

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
