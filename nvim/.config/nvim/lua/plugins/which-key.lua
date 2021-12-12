require("which-key").setup({})

-- Highlight groups defined for WhichKey with their default link
-- https://github.com/folke/which-key.nvim#-colors
vim.cmd([[highlight default link WhichKey          htmlH1]])
vim.cmd([[highlight default link WhichKeySeperator String]])
vim.cmd([[highlight default link WhichKeyGroup     Keyword]])
vim.cmd([[highlight default link WhichKeyDesc      Include]])
vim.cmd([[highlight default link WhichKeyFloat     CursorLine]])
vim.cmd([[highlight default link WhichKeyValue     Comment]])


-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
-- }
--
local opts = {
    prefix = "<leader>",
}

local mappings = {
    o = {
        name = "open",
        l = { ":lopen<CR>", "Open Location List" },
        q = { ":copen<CR>", "Open Quick Fix" },
    },

    t = {
        name = "toggle",
        p = { ":set paste!<CR>:echo 'Toggle Paste'<CR>", "Toggle Paste" },
        s = { ":set spell!<CR>:echo 'Toggle Spell Check'<CR>", "Toggle Spell Check" }
    },

    v = {
        name = "vimrc",
        e = { ":e $MYVIMRC<CR>","Edit Neovim Init" },
        s = { ":luafile %<CR>:echo 'Sourced Neovim Init'<CR>", "Source Neovim Init" },
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
