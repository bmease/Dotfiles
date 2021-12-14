local M = {}


-- remap function
M.map = function(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function(shortcut, command)
	map("n", shortcut, command)
end

M.imap = function(shortcut, command)
	map("i", shortcut, command)
end

M.vmap = function(shortcut, command)
	map("v", shortcut, command)
end

M.cmap = function(shortcut, command)
	map("c", shortcut, command)
end

M.tmap = function(shortcut, command)
	map("t", shortcut, command)
end


return M
