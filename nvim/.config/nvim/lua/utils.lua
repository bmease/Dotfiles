local M = {}


-- remap function
local map = function(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.map = map

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

--- Set the foreground and background colors of a highlight group
---@param group string - Group to set.
---@param fgcolor string - Foreground color.
---@param bgcolor string - Background color.
M.highlight = function(group, fgcolor, bgcolor)
	vim.cmd('highlight ' .. group .. ' guifg=' .. fgcolor .. ' guibg=' .. bgcolor)
end


return M
