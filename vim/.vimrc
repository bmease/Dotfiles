
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'nanotech/jellybeans.vim'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'klen/python-mode'
Bundle 'samsonw/vim-task'
Bundle 'msanders/snipmate.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rking/ag.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Syntax
syntax on

" Remap to make escapes easier
inoremap jj <Esc>
vnoremap v <Esc>

" Move over long lines
nnoremap j gj
nnoremap k gk

" Retain selection in visual mode when indenting blocks
vnoremap < <gv
vnoremap > >gv

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Fold with spacebar
nnoremap <Space> za

" Highlight long lines
set colorcolumn=79

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
nnoremap / /\v
vnoremap / /\v

" Matches brackets
set showmatch
set mat=2


" Leader Key
let mapleader=','

  " Edit/reload the vimrc filo
  nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
  nmap <leader>sv :so $MYVIMRC<CR>

  " Search
  nmap <silent> <leader>/ :nohlsearch<CR>

  " Plugins
  nmap <silent> <leader>nt :NERDTree<CR>
  nmap <silent> <leader>g :Rgrep<CR>
  nmap <leader>gs :Gstatus<CR>



set noswapfile



set encoding=utf-8
set termencoding=utf-8
set laststatus=2
set fillchars+=stl:\ ,stlnc:\

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set number
set relativenumber

" NERDTree
let NERDTreeIgnore=['\.pyc']

" Powerline font (requires restart)
let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'

"let g:jellybeans_use_lowcolor_black = 0
let g:jellybeans_overrides = { 'Signcolumn': { 'guibg': '1c1c1c' }}

" colorscheme
colorscheme jellybeans


" fold coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" Airline Settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
