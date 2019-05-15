" INFO {{{1

" Reference {{{2

"  https://github.com/mhinz/vim-galore
"  https://github.com/akrawchyk/awesome-vim
"  http://learnvimscriptthehardway.stevelosh.com/
"  https://dougblack.io/words/a-good-vimrc.html


" Reference .vimrc {{{2

"  https://bitbucket.org/sjl/dotfiles/
"  https://github.com/agkozak/dotfiles/blob/master/.vimrc
"  https://github.com/Gandalf-/DotFiles/blob/master/etc/vimrc
"  https://github.com/robertmeta/vimfiles/blob/master/vimrc


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

" Comfortable Motion {{{3
" Physics-based smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" Lightline {{{3
" A light and configurable statusline/tabline plugin
Plug 'itchyny/lightline.vim'

" Jellybeans {{{3
" A colorful, dark color scheme for Vim
Plug 'nanotech/jellybeans.vim'

" Devicons {{{3
" Adds file type glyphs/icons to popular Vim plugins
" NOTE: Might not need this anymore
Plug 'ryanoasis/vim-devicons'

" Highlighted Yank {{{3
" Make the yanked region apparent
Plug 'machakann/vim-highlightedyank'

" Maximizer {{{3
" Maximizes and restores the current window in Vim
Plug 'szw/vim-maximizer'

" Vim Signature {{{3
" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" Vim Markbar {{{3
" Plug 'Yilin-Yang/vim-markbar'

" Vim Peekaboo {{{3
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'junegunn/vim-peekaboo'

" Vista {{{3
" View and search language server symbols, tags in Vim
Plug 'liuchengxu/vista.vim'

" }}}

" Language Specific {{{2

" Polygot {{{3
" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Vue {{{3
" Syntax Highlight for Vue.js components
Plug 'posva/vim-vue'



" }}}

" File Navigation {{{2

" FZF {{{3
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ranger {{{3
" Use ranger for file navigation. Requres bclose
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


" Git {{{2

" Fugitive {{{3
Plug 'tpope/vim-fugitive'

" Git Gutter {{{3
Plug 'airblade/vim-gitgutter'

" Git Gist {{{3
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Rhubarb {{{3
Plug 'tpope/vim-rhubarb'

" }}}

" Completion {{{2

" COC {{{3
" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Utilisnips {{{3
Plug 'SirVer/ultisnips'

" Auto-pairs {{{3
Plug 'jiangmiao/auto-pairs'

" Vim Snippets {{{3
Plug 'honza/vim-snippets'

" Supertab {{{3
Plug 'ervandew/supertab'

" NERD Commenter {{{3
Plug 'scrooloose/nerdcommenter'

" Vim Gutentags {{{3
Plug 'ludovicchabant/vim-gutentags'

" Editorconfig {{{3
Plug 'editorconfig/editorconfig-vim'

" JSDoc {{{3
Plug 'heavenshell/vim-jsdoc'


" Linting {{{2

" Editing {{{2 

" Vim Sandwich {{{3
" The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
Plug 'machakann/vim-sandwich'

" Vim Submode {{{3
Plug 'kana/vim-submode'


" Targets {{{3
" Vim plugin that provides additional text objects
Plug 'wellle/targets.vim'


" Tmux {{{2
" Tmux Navigator {{{3
" NOTE: might not need this?
Plug 'christoomey/vim-tmux-navigator'

" }}} Tmux Focus Events {{{3
Plug 'tmux-plugins/vim-tmux-focus-events'

" }}} Tmux Clipboard {{{3
Plug 'roxma/vim-tmux-clipboard'

call plug#end()
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
" set tabstop=4
" set shiftwidth=4
" set expandtab

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

set modelines=1


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

    " Rename
    " nmap <leader>r :call RopeRename()

    nmap <leader>b :Buffers<CR>
    nmap <leader>f :GFiles<CR>

    map <leader>nt :Ranger<CR>

" }}}
" File Type Specific Settings {{{1

" Vue {{{2
augroup vue
    autocmd!
    autocmd FileType vue syntax sync fromstart
    autocmd BufNewFile,BufRead *.vue setf vue

    " Deal with losing syntax constantly
    autocmd FileType vue nnoremap <silent> G :syntax sync fromstart<cr>G
    autocmd FileType vue nnoremap <silent> <C-d> :syntax sync fromstart<cr><C-d>
    autocmd FileType vue nnoremap <silent> <C-u> :syntax sync fromstart<cr><C-u>
augroup END


" Javascript {{{2
augroup javascript_folding
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
    autocmd FileType vue setlocal foldmethod=syntax
augroup END


" Terminal {{{2
augroup Terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" }}}1
" Plugin Specific Settings  {{{1

" COC {{{2
" Show all diagnostics
nnoremap <silent> <leader>l :<C-u>CocList<cr>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of current line
nmap <leader>ca <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Lightline {{{2
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
    \             ['cocstatus', 'fugitive', 'readonly', 'relativepath', 'modified'] ],
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
    \   'gutentags': 'LightlineGutentags',
    \   'cocstatus': 'coc#status'
    \ },
    \
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

" lightline displays mode instead
set noshowmode


" NERD Commenter {{{2
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


" Supertab {{{2
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1


" Utilisnips {{{2
let g:UltiSnipsExpandTrigger="<tab>"


" Maximizer {{{2
let g:maximizer_set_default_mapping = 0


" Vista {{{2
let g:vista_default_executive = 'coc'

" Toggle vista tagbar
nmap <silent> <leader>t :Vista!!<CR>


" Polygot {{{2
let g:polyglot_disabled = ['vue']


" Vue {{{2
let g:vue_disable_pre_processors=1

" To use NERDCommenter with Vue files, you can use its "hooks" feature to temporarily change the filetype.
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


" FZF {{{3
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


" Ranger {{{2
" map our own keys
let g:ranger_map_keys = 0

" Replace netrw
let g:ranger_replace_netrw = 1


" Git Gutter {{{2
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified_removed = ''
set updatetime=100


" JSDoc {{{2
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


" Vim Submode {{{2
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





" vim:foldmethod=marker:foldlevel=0
