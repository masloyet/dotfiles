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

nnoremap <c-j> :bn<CR>
nnoremap <c-k> :bp<CR>

map <c-f> :py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py<cr>
imap <c-f> <c-o>:py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py<cr>

"-------------------
"----- LEADER ------
"-------------------

let mapleader=' '

"nnoremap <leader>R :au BufWrite *.md :silent !pandoc -o %:r.pdf % &<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <silent><leader>v :vs<CR>

nnoremap <silent><leader>h <c-w>h
nnoremap <silent><leader>l <c-w>l
nnoremap <silent><leader>j <c-w>j
nnoremap <silent><leader>k <c-w>k

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

call plug#end()

set background=dark
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



