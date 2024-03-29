imap jk <Esc>

set mouse=a

filetype plugin on
filetype indent on

set hidden
set encoding=utf-8

set ruler
syntax enable 

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

set clipboard+=unnamedplus

set backspace=indent,eol,start

set completeopt-=preview

set jumpoptions=stack

set nu
set rnu

command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | bo cw | redraw!

"-------------------
"----- LEADER ------
"-------------------

let mapleader=' '
let maplocalleader='\'

nnoremap <silent><leader>f :FZF<CR>
nnoremap <silent><leader>up :checkt<CR>
nnoremap <silent><leader>n :noh<CR>

nnoremap <leader>v :vs<CR>
nnoremap <leader>= <c-w>=
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"-------------------
"----- VIMPLUG -----
"-------------------

call plug#begin()

Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

call plug#end()

"-------------------
"----- GRUVBOX -----
"-------------------

set bg=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

"-------------------
"----- LUA INCL ----
"-------------------

lua require('lsp')
