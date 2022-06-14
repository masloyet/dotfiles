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

nnoremap <leader>s :new<CR>:call Scratch()<CR>


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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"-------------------
"------ COC --------
"-------------------

set updatetime=300
set signcolumn=yes

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"






set background=dark
colorscheme gruvbox

nnoremap <c-j> :bn<CR>
nnoremap <c-k> :bp<CR>
map <c-f> :py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py<cr>
imap <c-f> <c-o>:py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py<cr>


au FileType gitcommit setlocal tw=72


