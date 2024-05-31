let mapleader = "\\"
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>c :w !clip.exe<cr>
vmap <leader>c :w !clip.exe<cr>
nmap <leader>t :bo term<cr>
nmap <leader>w :w!<cr>
nmap <leader>- :Ve .<cr>
nmap <leader>= :E<cr>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_winsize = 30

set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase

set laststatus=2
filetype plugin indent on
syntax enable
colorscheme dracula
set termguicolors

" Visual Studio
map gi :vsc Edit.GoToImplementation<cr>

if has("gui_running")
    set guifont=Cascadia\ Mono:h11
    set lines=38
    set columns=100
    set guioptions-=T
    set guioptions-=e
    set shell=pwsh

    nmap <leader>c :%y+<cr>
    vmap <leader>c "+y<cr>
endif
