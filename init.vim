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

set backspace=indent,eol,start

set nu
set rnu

inoremap <c-enter> <c-x><c-o>

map <silent><c-G> :Git<CR>

command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | bo cw | redraw!

"-------------------
"----- LEADER ------
"-------------------

let mapleader=' '

nnoremap <leader>f :FZF<CR>
nnoremap <silent><leader>v :vs<CR>
nnoremap <silent><leader>up :checkt<CR>
nnoremap <silent><leader>g :Ggr <cword><CR>

nnoremap <silent><leader>q :wq<CR>
nnoremap <silent><leader>w :w<CR>

nnoremap <silent><leader>n :noh<CR>

nnoremap <silent><leader>= <c-w>=

nnoremap <silent><leader>py :!python3 %<CR>
nnoremap <silent><leader>F :%!fmt -70<CR>

"-------------------
"----- VIMPLUG -----
"-------------------

"~/.vim/plugged
call plug#begin()

Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"-------------------
"----- GRUVBOX -----
"-------------------

set bg=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

"-------------------
"----- ULTISNIP ----
"-------------------

let g:vimtex_quickfix_open_on_warning=0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

"-------------------
"----- LUA INCL ----
"-------------------

lua require('treesitter')
lua require('lsp')

"-------------------
"-----   RUST   ----
"-------------------

autocmd FileType rust nnoremap <leader>b :!cargo b<CR>
autocmd FileType rust nnoremap <leader>t :!cargo t<CR>
autocmd FileType rust nnoremap <leader>r :!cargo r<CR>

"-------------------
"-----   DART   ----
"-------------------

autocmd FileType dart set softtabstop=2
autocmd FileType dart set shiftwidth=2
autocmd FileType dart set tabstop=2

