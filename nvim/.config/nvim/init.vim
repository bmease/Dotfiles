" TODO
"
" https://github.com/carlitux/deoplete-ternjs
" https://github.com/Shougo/neco-syntax
" https://github.com/othree/jspc.vim
" https://github.com/editorconfig/editorconfig-vim#readme
" https://github.com/janko-m/vim-test
" https://github.com/stylelint/stylelint


call plug#begin('~/.config/nvim/plugged')

" Command       | Description
" ------------- | ------------
" :PlugInstall  | Install plugins
" :PlugUpdate   | Install or update plugins
" :PlugClean    | Remove unused directories
" :PlugUpgrade  | Upgrade vim-plug itself
" :PlugStatus   | Check status of plugins
" :PlugDiff     | Examine changes from previous update
" :PlugSnapshot | Generate script for restoring plugins

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'

" Language Specific
Plug 'sheerun/vim-polyglot'  " Syntax Highlighting for many languages
let g:polyglot_disabled = ['vue']

" Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1

augroup vue
    autocmd!
    autocmd FileType vue syntax sync fromstart
augroup END

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" File Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-rhubarb'
Plug 'SevereOverfl0w/deoplete-github'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'

" Linting
Plug 'w0rp/ale'

" Editing
Plug 'machakann/vim-sandwich'
Plug 'kana/vim-submode'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

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
    nmap <leader>nt :NERDTreeToggle<CR>

    " isort
    nmap <leader>= :!isort %<CR>

    " Toggle comments
    vnoremap <silent> <leader>c :call NERDComment("nx", "invert")<CR>

    " Last Buffer
    nmap <silent> <esc> :b#<CR>

    " Toggle linting
    nmap <leader>l :ALEToggle<CR>

    " Toggle tagbar
    nmap <silent> <leader>t :TagbarToggle<CR>

    " Rename
    nmap <leader>r :call RopeRename()




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
" set lazyredraw

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
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Window Splits
noremap <C-_> :split<CR>
noremap <C-Bslash> :vsplit<CR>

" Switch buffers without saving
set hidden

" Folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> za

" Zoom window (sorta)
nnoremap <c-space> :tab split<CR>

" Run macro when in visual
vnoremap q :norm @q<CR>

" Sort lines when in visual
vnoremap s :!sort<CR>


colorscheme jellybeans

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'

let g:ale_lint_on_text_changed = 'never'

let g:ale_open_list = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_window_size = 5
let g:ale_echo_msg_format = '[%linter%][%severity%] %s '

let g:ale_python_flake8_executable = 'python3.6'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'python3.6'
let g:ale_python_pylint_options = '-m pylint'

let g:ale_linters = {}
let g:ale_linters.python = ['yapf', 'flake8', 'pylint', 'isort']
let g:ale_linters.javascript = ['eslint']

let g:ale_fixers = {}
let g:ale_fixers.python = ['yapf']  " Flake8 and pylint throw error?
let g:ale_fixers.javascript = ['eslint']

let g:deoplete#enable_at_startup = 1

" Setup Icons for deoplete
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('github',        'mark', '')
call deoplete#custom#source('jedi',          'mark', '')
call deoplete#custom#source('member',        'mark', '.')
call deoplete#custom#source('neosnippet',    'mark', '⌘')
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('vim',           'mark', '')
call deoplete#custom#source('tern',          'mark', '')



" Trying to setup deoplete to use vim-rhubarb or deoplete-github
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.gitcommit = ['github']
"
" let g:deoplete#sources = {}
" let g:deoplete#sources['gitcommit'] = ['github']

" let g:deoplete#sources = {}
" let g:deoplete#sources.gitcommit = []
"
" let g:deoplete#keyword_patterns = {}
" "let g:deoplete#keyword_patterns.gitcommit = '[^ \t]+'
" let g:deoplete#keyword_patterns.gitcommit = '.+'
"
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif
"
" call deoplete#util#set_pattern(
"   \ g:deoplete#omni#input_patterns,
"   \ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])




let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeIgnore = ['.ropeproject', '.git', '__pycache__']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1

let g:javascript_plugin_jsdoc = 1

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

let g:submode_always_show_submode = 1

" Resize Windows
call submode#enter_with('window', 'n', '', '<C-r>')
call submode#leave_with('window', 'n', '', '<ESC>')
call submode#leave_with('window', 'n', '', '<ENTER>')
call submode#map('window', 'n', '', 'h', '5<C-w>>')
call submode#map('window', 'n', '', 'j', '5<C-w>-')
call submode#map('window', 'n', '', 'k', '5<C-w>+')
call submode#map('window', 'n', '', 'l', '5<C-w><')
call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')


" Autocommands

" augroup javascript_folding
"     autocmd!
"     autocmd FileType javascript setlocal foldmethod=syntax
" augroup END


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
