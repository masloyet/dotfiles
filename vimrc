imap jk <Esc>

set mouse=a

filetype plugin on
filetype indent on

set hidden
set encoding=utf-8

set ruler
syntax enable 

set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

set backspace=indent,eol,start

set nu
set rnu

"-------------------
"----- LEADER ------
"-------------------

let mapleader=' '

nnoremap <leader>R :au BufWrite *.md :silent !pandoc -o %:r.pdf % &<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <silent><leader>v :vs<CR>
nnoremap <silent><leader>h <c-w>h
nnoremap <silent><leader>l <c-w>l


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

Plug 'kovisoft/slimv'

call plug#end()

"-------------------
"----- ULTISNIP ----
"-------------------

let g:vimtex_quickfix_open_on_warning=0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
