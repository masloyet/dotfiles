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

inoremap <c-enter> <c-x><c-o>

map <silent><c-G> :Git<CR>

command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | bo cw | redraw!

"-------------------
"----- LEADER ------
"-------------------

let mapleader=' '

"nnoremap <leader>R :au BufWrite *.md :silent !pandoc -o %:r.pdf % &<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <silent><leader>v :vs<CR>
nnoremap <silent><leader>g :Ggr <cword><CR>

nnoremap <silent><leader>n :noh<CR>

nnoremap <silent><leader>= <c-w>=

"-------------------
"----- VIMPLUG -----
"-------------------

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

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

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-------------------
"----- LUA INCL ----
"-------------------

lua require('treesitter')
lua require('lsp')

