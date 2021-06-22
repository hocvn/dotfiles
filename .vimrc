set syntax=cpp
filetype off

syntax enable
syntax on

set nocompatible
set number       
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set backspace=indent,eol,start

set clipboard=unnamedplus
set encoding=utf-8

call plug#begin('~/.vim/autoload')

Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/codota/tabnine-vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/jiangmiao/auto-pairs'

call plug#end()          

"Set shortcuts NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"colorscheme solarized
set termguicolors

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Build and Compile file
autocmd filetype cpp nnoremap <F8> :w !g++ -std=c++11 -O2 -Wall % -o %:r <Enter>
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && ./%:r <Enter>
autocmd filetype cpp nnoremap <F10> :w !g++ -std=c++11 -O2 -Wall % -o %:r && ./%:r < ./%:r.txt <Enter>

filetype plugin indent on

