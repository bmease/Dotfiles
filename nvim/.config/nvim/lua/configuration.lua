local set = vim.opt
local cmd = vim.cmd

-- cmd("colorscheme jellybeans")
-- cmd("colorscheme tokyonight")

set.encoding = 'utf-8'              --- The encoding displayed
set.fileencoding = 'utf-8'          --- The encoding written to file
set.termguicolors = true            --- Correct terminal colors

-- Completion times
set.updatetime = 100
set.timeoutlen = 250

-- Search
set.showmatch = true
set.hlsearch = true
set.incsearch = true                --- Start searching before pressing enter
set.ignorecase = true
set.smartcase = true                --- Uses case in search
set.gdefault = true

-- Realtime replace
set.inccommand = 'nosplit'

-- Match brackets
set.showmatch = true
set.mat = 2

-- Highlight long lines
set.colorcolumn = "79"

-- Line numbers
set.number = true
set.relativenumber = true
vim.o.signcolumn = "yes"

-- Tabs
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true


-- Highlight on yank
vim.cmd([[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{ timeout=500 }
    augroup END
]])

