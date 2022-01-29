require("which-key").setup({
    plugins = {
        spelling = {
            enabled = true
        },
    },

    icons = {
        separator = " ➜ ",

    },

    layout = {
        width = { min = 20, max = 70 },
        spacing = 10,
        align = "center"
    },

    window = {
        -- border = "rounded",
        -- style = "minimal",
        winblend = 0
    }

})

-- Highlight groups defined for WhichKey with their default link
-- https://github.com/folke/which-key.nvim#-colors
-- vim.cmd([[highlight default link WhichKey          htmlH1]])
-- vim.cmd([[highlight default link WhichKeySeperator String]])
-- vim.cmd([[highlight default link WhichKeyGroup     Keyword]])
-- vim.cmd([[highlight default link WhichKeyDesc      Include]])
-- vim.cmd([[highlight default link WhichKeyFloat     CursorLine]])
-- vim.cmd([[highlight default link WhichKeyValue     Comment]])

local highlight = require('utils').highlight
local colors = require("tokyonight.colors").setup()

highlight('WhichKey', colors.purple, colors.bg_dark)
highlight('WhichKeyFloat', colors.bg_dark, colors.bg_dark)
highlight('WhichKeySeperator', colors.purple, colors.bg_dark)

local opts = {
    prefix = "<leader>",
}

local mappings = {
    name = "Leader",

    h = {
        name = "Hunk"
    },

    o = {
        name = "Open",
        l = { ":lopen<CR>", "  Open Location List" },
        q = { ":copen<CR>", "  Open Quick Fix" },
    },

    t = {
        name = "Toggle",
        p = { ":set paste!<CR>:echo 'Toggle Paste'<CR>", " Toggle Paste" },
        s = { ":set spell!<CR>:echo 'Toggle Spell Check'<CR>", "暈Toggle Spell Check" }
    },

    v = {
        name = "Neovim",
        c = { "<cmd>lua require('telescope.builtin').colorscheme()<CR>", "Colorschemes" },
        e = { ":e $MYVIMRC<CR>"," Edit Neovim Init" },
        s = { ":luafile %<CR>:echo 'Sourced Neovim Init'<CR>", " Source Neovim Init" },
        h = { ":checkhealth<CR>", "Check health"},
        o = { "<cmd>lua require('telescope.builtin').vim_options()<CR>", "Neovim Options" },
    },

    ["?"] = { ":WhichKey<CR>", "Keymapping Help" }
}

local wk = require("which-key")
wk.register(mappings, opts)
