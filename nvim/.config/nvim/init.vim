" TODO
"
" https://github.com/tpope/vim-rhubarb
" https://github.com/SevereOverfl0w/deoplete-github
" https://github.com/carlitux/deoplete-ternjs
" https://github.com/Shougo/neco-syntax
" https://github.com/othree/jspc.vim
" https://github.com/editorconfig/editorconfig-vim#readme
" https://github.com/janko-m/vim-test
" https://github.com/stylelint/stylelint


call plug#begin('~/.config/nvim/plugged')

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'

" Language Specific
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

" File Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'

" Linting
Plug 'w0rp/ale'

" Editing
Plug 'machakann/vim-sandwich'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" :PlugInstall



call plug#end()


" Leader Key
let mapleader=','

    " Edit/reload init.vim
    nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
    nmap <leader>sv :so $MYVIMRC<CR>

    " Search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Buffer search
    nmap <leader>b :Buffers<CR>

    " File search
    nmap <leader>f :GFiles<CR>

    " Search
    nmap <leader>g :Ag 

    " toggle paste
    nmap <leader>p :set paste! paste?<CR>

    " toggle spell
    nmap <leader>s :set spell! spell?<CR>

    " open quickfix
    nmap <leader>q :copen<CR>

    " NerdTree
    nmap <leader>nt :NERDTree<CR>

    " isort
    nmap <leader>= :!isort %<CR>

    " Toggle comments
    vnoremap <silent> <leader>c :call NERDComment("nx", "Toggle")<CR>

    " Last Buffer
    nmap <silent> <esc> :b#<CR>

    " Toggle linting
    nmap <silent> <leader>l :ALEToggle<CR>

    " Toggle tagbar
    nmap <silent> <leader>t :TagbarToggle<CR>




" General Settings
set encoding=utf8
set termencoding=utf-8
set laststatus=2

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
nnoremap / /\v
vnoremap / /\v

" Realtime replace
set inccommand=nosplit

" Matches brackets
set showmatch
set mat=2

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set number
set relativenumber

" Remap to make escapes easier
inoremap jj <Esc>
vnoremap v <Esc>

" Move over long lines
nnoremap j gj
nnoremap k gk

" Retain selection in visual mode when indenting blocks
vnoremap < <gv
vnoremap > >gv

" Highlight long lines
set colorcolumn=79

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Switch buffers without saving
set hidden

" Folding
set foldmethod=indent
set foldlevelstart=99
nmap <space> za

" Zoom window (sorta)
nmap <c-space> :tab split<CR>


colorscheme jellybeans

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'

let g:ale_open_list = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_window_size = 5
let g:ale_echo_msg_format = '[%linter%][%severity%] %s '
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'

let g:ale_linters = {}
let g:ale_linters.python = ['yapf', 'flake8', 'pylint']
let g:ale_linters.javascript = ['eslint']

let g:ale_fixers = {}
let g:ale_fixers.python = ['yapf']  " Flake8 and pylint throw error?
let g:ale_fixers.javascript = ['eslint']

let g:deoplete#enable_at_startup = 1

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

let g:javascript_plugin_jsdoc = 1

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1


" Autocommands

augroup javascript_folding
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END


" Prevent ale from linting to frequently since eslint is slow
" augroup ale_javascript
"     autocmd!
"     autocmd FileType javascript |
"             \ let b:ale_lint_on_text_changed = 'never' |
"             \ let b:ale_lint_on_enter = 0 |
"             \ let b:ale_lint_on_save = 1
"     autocmd FileType vue |
"             \ let b:ale_lint_on_text_changed = 'never' |
"             \ let b:ale_lint_on_enter = 0 |
"             \ let b:ale_lint_on_save = 1
" augroup END
