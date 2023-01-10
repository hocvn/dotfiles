set syntax=cpp
filetype off

syntax enable
syntax on

set cursorline
set nocompatible
set number       
set tabstop=4
set shiftwidth=4   " tab = 4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set backspace=indent,eol,start
set t_Co=256

set smartcase     " use case sensitive if I use uppercase
set shiftround    " when shifting non-aligned set of lines, align them to next tabstop

set clipboard=unnamedplus
set encoding=utf-8

call plug#begin('~/.vim/autoload')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
    
call plug#end()          

"Set shortcuts NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"let g:lightline = {'colorscheme': 'catppuccin_mocha'}
set termguicolors
colorscheme catppuccin_mocha

" airline themes
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
  
"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' | ln:'
let g:airline_symbols.maxlinenr = ' | '
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr='col:'"

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Build and Compile file C/C++
autocmd filetype cpp nnoremap <F5> :w !g++ -std=c++11 -O2 -Wall % -o %:r <Enter>
autocmd filetype cpp nnoremap <F6> :w <bar> !clear; g++ -std=c++11 -O2 -Wall % -o %:r && ./%:r <Enter>
autocmd filetype cpp nnoremap <F9> :w !g++ -std=c++11 -O2 -Wall % -o %:r && ./%:r < ./%:r.txt <Enter>

" Build and Compile file Python
autocmd Filetype python nnoremap <buffer> <F5> :w <CR> :vert ter python3 "%"<CR>
autocmd Filetype python nnoremap <F6> <Esc> :w <CR> :!clear; python3 %<CR>

" YouCompleteMe
set completeopt-=preview  " Close Scratch Window

" Set tab
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

filetype plugin indent on
