-- remap function
-- local function map(mode, shortcut, command)
-- 	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
-- end
--
-- local function nmap(shortcut, command)
-- 	map("n", shortcut, command)
-- end
--
-- local function imap(shortcut, command)
-- 	map("i", shortcut, command)
-- end
--
-- local function vmap(shortcut, command)
-- 	map("v", shortcut, command)
-- end

utils = require('utils')
map = utils.map
nmap = utils.nmap
imap = utils.imap
vmap = utils.vmap

-- Map leader to ,
vim.g.mapleader = ","

-- Remap to make escapes easier
imap("jj", "<Esc>")
vmap("v", "<Esc>")

-- Retain selection in visual mode when indenting blocks
vmap(">", "<gv")
vmap(">", ">gv")

-- Window splits
nmap("<C-_>", ":split<CR>")
nmap("<C-Bslash", ":vsplit<CR>")

-- Folding
nmap("<space>", "za")
vmap("<space", "zf")

-- Run macro when in visual
vmap("q", ":norm @q<CR>")

-- Sort lines when in visual
vmap("s", ":!sort<CR>")

-- Esc goes to last buffer
nmap("<esc>", ":b#<CR>")

-- Easier window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- nmap("<C-Underscore>", "<C-w>s")
nmap("<C-Minus>", ":split<cr>")
nmap("<C-Bslash>", "<C-w>v")
