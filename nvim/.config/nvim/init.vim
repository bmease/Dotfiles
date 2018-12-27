" TODO {{{1

" Reference {{{2
"
"  https://github.com/mhinz/vim-galore
"  https://github.com/akrawchyk/awesome-vim
"  http://learnvimscriptthehardway.stevelosh.com/
"  https://dougblack.io/words/a-good-vimrc.html


" Reference .vimrc {{{2
"
"  https://bitbucket.org/sjl/dotfiles/
"  https://github.com/agkozak/dotfiles/blob/master/.vimrc
"  https://github.com/Gandalf-/DotFiles/blob/master/etc/vimrc
"  https://github.com/robertmeta/vimfiles/blob/master/vimrc
"
"
" Plugins to consider {{{2

"  https://github.com/carlitux/deoplete-ternjs
"  https://github.com/Shougo/neco-syntax
"  https://github.com/othree/jspc.vim
"  https://github.com/janko-m/vim-test
"  https://github.com/stylelint/stylelint
"
"  https://github.com/junegunn/vim-peekaboo
"  https://github.com/tomtom/quickfixsigns_vim
"  https://github.com/numirias/semshi
"  https://github.com/othree/javascript-libraries-syntax.vim
"  https://github.com/liuchengxu/vim-which-key
"  https://github.com/wellle/targets.vim
"  https://github.com/terryma/vim-expand-region
"  https://wakatime.com/

" }}}

" Plugins {{{1

" Command       | Description
" ------------- | ------------
" :PlugInstall  | Install plugins
" :PlugUpdate   | Install or update plugins
" :PlugClean    | Remove unused directories
" :PlugUpgrade  | Upgrade vim-plug itself
" :PlugStatus   | Check status of plugins
" :PlugDiff     | Examine changes from previous update
" :PlugSnapshot | Generate script for restoring plugins

" Auto Install Vim Plug {{{2

" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" }}}

" User Interface {{{2

" Plug 'yuttie/comfortable-motion.vim'
" Lightline {{{3
Plug 'itchyny/lightline.vim'

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightlineGutentags()
    return gutentags#statusline()
endfunction

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['fugitive', 'readonly', 'relativepath', 'modified'] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['filetype'], ['gutentags'] ]
    \ },
    \
    \ 'inactive': {
    \   'left': [ ['relativepath', 'modified'] ],
    \   'right': [ ]
    \ },
    \
    \ 'component': {
    \   'lineinfo': '%3l:%-2v',
    \ },
    \
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive',
    \   'gutentags': 'LightlineGutentags'
    \ },
    \
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

" lightline displays mode instead
set noshowmode

" }}} Jellybeans {{{3
Plug 'nanotech/jellybeans.vim'

" }}} Devicons {{{3
Plug 'ryanoasis/vim-devicons'

" }}} Highlighted Yank {{{3
Plug 'machakann/vim-highlightedyank'

" }}} Maximizer {{{3
Plug 'szw/vim-maximizer'
let g:maximizer_set_default_mapping = 0

" }}} Tagbar {{{3
Plug 'majutsushi/tagbar'
let g:tagbar_type_javascript = {
    \ 'kinds' : [
        \ 'A:Arrays',
        \ 'C:Classes',
        \ 'E:Exports',
        \ 'F:Functions',
        \ 'G:Generators',
        \ 'I:Imports',
        \ 'M:Methods',
        \ 'P:Properties',
        \ 'O:Objects',
        \ 'T:Tags',
        \ 'V:Variables'
    \ ],
\ }

" }}} Vim Signature {{{3
Plug 'kshenoy/vim-signature'

" }}} Vim Markbar {{{3
" Plug 'Yilin-Yang/vim-markbar'

" }}} Vim Peekaboo {{{3
Plug 'junegunn/vim-peekaboo'



" }}}

" Language Specific {{{2
" }}} Polygot {{{3
Plug 'sheerun/vim-polyglot'  " Syntax Highlighting for many languages
let g:polyglot_disabled = ['vue']

" }}} Vue {{{3
Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1

augroup vue
    autocmd!
    autocmd FileType vue syntax sync fromstart
    autocmd BufNewFile,BufRead *.vue setf vue

    " Deal with losing syntax constantly
    autocmd FileType vue nnoremap <silent> G :syntax sync fromstart<cr>G
    autocmd FileType vue nnoremap <silent> <C-d> :syntax sync fromstart<cr><C-d>
    autocmd FileType vue nnoremap <silent> <C-u> :syntax sync fromstart<cr><C-u>

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

" }}}

" File Navigation {{{2
" FZF {{{3
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Hide statusline for fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" }}} Ranger {{{3
" Use ranger for file navigation. Requres bclose
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" map our own keys
let g:ranger_map_keys = 0

" Replace netrw
let g:ranger_replace_netrw = 1

" }}} 

" Git {{{2
" }}} Fugitive {{{3
Plug 'tpope/vim-fugitive'

" }}} Git Gutter {{{3
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified_removed = ''
set updatetime=100

" }}} Git Gist {{{3
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" }}} Rhubarb {{{3
Plug 'tpope/vim-rhubarb'
" Plug 'SevereOverfl0w/deoplete-github'




" Completion {{{2

" Plug 'zchee/deoplete-jedi'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Deoplete {{{3
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1

" Setup Icons for deoplete
function! SetupDeopleteIcons()
    if v:vim_did_enter
    else
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
    endif
endfunction

augroup DeopleteIcons
    autocmd!
    autocmd! VimEnter * call SetupDeopleteIcons()
augroup END

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


" LanguageClient-neovim {{{3
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_selectionUI = "location-list"
let g:LanguageClient_diagnosticsList = "Location"
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'vue': ['vls'],
    \ 'python': ['pyls'],
    \ }

nnoremap <silent> <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
"}}}
" }}} Utilisnips {{{3
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"

" }}} Auto-pairs {{{3
Plug 'jiangmiao/auto-pairs'
" }}} Vim Snippets {{{3
Plug 'honza/vim-snippets'
" }}} Supertab {{{3
Plug 'ervandew/supertab'

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

" }}} NERD Commenter {{{3
Plug 'scrooloose/nerdcommenter'

let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
" }}} Vim Gutentags {{{3
Plug 'ludovicchabant/vim-gutentags'
" }}} Editorconfig {{{3
Plug 'editorconfig/editorconfig-vim'

" }}} Utilisnips {{{3
Plug 'heavenshell/vim-jsdoc'

let g:javascript_plugin_jsdoc = 1
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_param_description_separator=' - '
let g:jsdoc_user_defined_tags = {
    \ '@vue-data': 'data',
    \ '@vue-prop': 'prop',
    \ '@vue-computed': 'computed',
    \ }
nmap <leader>j :JsDoc<CR>

" Linting {{{2

" ALE {{{3
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1

let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_window_size = 5

let g:ale_echo_msg_format = '[%severity%][%linter%][%code%] %s '
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_info_str =  ''

let g:ale_python_flake8_executable = 'python3.6'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'python3.6'
let g:ale_python_pylint_options = '-m pylint'

let g:ale_linters = {}
" Use LanguageClient to handle linting
" let g:ale_linters.python = ['yapf', 'flake8', 'pylint', 'isort']
let g:ale_linters.javascript = ['eslint', 'prettier']

let g:ale_fixers = {}
let g:ale_fixers.python = ['yapf', 'isort']  " Flake8 and pylint throw error?
let g:ale_fixers.javascript = ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.vue = ['prettier', 'eslint']

" Editing {{{2 

" Vim Sandwich {{{3
Plug 'machakann/vim-sandwich'

" Vim Submode {{{3
Plug 'kana/vim-submode'

let g:submode_always_show_submode = 1

function! SetupSubmodeConfig()
    call submode#enter_with('window', 'n', '', '<C-r>')
    call submode#leave_with('window', 'n', '', '<ESC>')
    call submode#leave_with('window', 'n', '', '<ENTER>')
    call submode#map('window', 'n', '', 'h', '1<C-w>>')
    call submode#map('window', 'n', '', 'j', '1<C-w>-')
    call submode#map('window', 'n', '', 'k', '1<C-w>+')
    call submode#map('window', 'n', '', 'l', '1<C-w><')
    call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')
endfunction

" Resize Windows
augroup SubmodeConfig
    autocmd!
    autocmd VimEnter * call SetupSubmodeConfig()
augroup END

" Targets {{{3
Plug 'wellle/targets.vim'


" Tmux {{{2
" Tmux Navigator {{{3
Plug 'christoomey/vim-tmux-navigator'
" }}} Tmux Focus Events {{{3
Plug 'tmux-plugins/vim-tmux-focus-events'
" }}} Tmux Clipboard {{{3
Plug 'roxma/vim-tmux-clipboard'

call plug#end()
" }}}

" Leader Key {{{1
let mapleader=','

    " Edit/reload init.vim
    nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
    nmap <leader>sv :so $MYVIMRC<CR>

    " Search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Search
    nmap <leader>g :Ag 
    " Search highlighted text
    vnoremap <leader>g y:Ag <C-R>"

    " toggle paste
    nmap <leader>p :set paste! paste?<CR>

    " toggle spell
    nmap <leader>s :set spell! spell?<CR>

    " open quickfix
    nmap <leader>q :copen<CR>

    nmap <leader>= :ALEFix<CR>

    " Toggle comments
    vnoremap <silent> <leader>c :call NERDComment("nx", "invert")<CR>

    " Last Buffer
    nmap <silent> <esc> :b#<CR>

    " Toggle linting
    " nmap <leader>l :ALEToggle<CR>

    " Toggle tagbar
    nmap <silent> <leader>t :TagbarToggle<CR>

    " Rename
    " nmap <leader>r :call RopeRename()

    nmap <leader>b :Buffers<CR>
    nmap <leader>f :GFiles<CR>

    map <leader>nt :Ranger<CR>

" }}}


" General Settings {{{1
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

" Don't highlight past 128 characters
" For speed
set synmaxcol=128


" Navigate to next window or create one if it doesn't exist
function! SetupWindowMove()
    function WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if (t:curwin == winnr())
            if (match(a:key,'[jk]'))
                wincmd v
            else
                wincmd s
            endif
            exec "wincmd ".a:key
        endif
    endfunction

    " Easy window navigation
    noremap <C-h> :call WinMove('h')<cr>
    noremap <C-j> :call WinMove('j')<cr>
    noremap <C-k> :call WinMove('k')<cr>
    noremap <C-l> :call WinMove('l')<cr>
endfunction

augroup WindowMove
    autocmd!
    autocmd! VimEnter * call SetupWindowMove()
augroup END

" noremap <C-H> <C-W>H
" noremap <C-J> <C-W>J
" noremap <C-K> <C-W>K
" noremap <C-L> <C-W>L

" Open current buffer in a new tab.
" nnoremap <c-space> :tab split<CR>

" Minimum size of a window
set winminheight=0
set winminwidth=0

" Maximize the current buffer and minimize all other in the tab.
nnoremap <silent> <c-space> :MaximizerToggle!<CR>

" Window Splits
noremap <C-_> :split<CR>
noremap <C-Bslash> :vsplit<CR>

set winfixheight
set winfixwidth

" Switch buffers without saving
set hidden

" Folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> za
vnoremap <space> zf

" Run macro when in visual
vnoremap q :norm @q<CR>

" Sort lines when in visual
vnoremap s :!sort<CR>

" Add function to determine if it's a single line and then break it into
" multiple lines for sorting: `:!tr , "\n" | sort | tr "\n" ,`

" Increase redraw time so we don't lose syntax highlighting
set redrawtime=10000

set background=dark
colorscheme jellybeans
highlight Comment cterm=italic


" Setup 24-bit True Color
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif









" Open vim help in a tab
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" Autocommands

augroup javascript_folding
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
    autocmd FileType vue setlocal foldmethod=syntax
augroup END

augroup Terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END



set modelines=1
" vim:foldmethod=marker:foldlevel=0
