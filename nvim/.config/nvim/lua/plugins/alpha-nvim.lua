-- TODO: add mru

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ "
}

dashboard.section.buttons.val = {
    dashboard.button("<leader> o f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("<leader> o r", "  Recently used files", "<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
    dashboard.button("<leader> o g", "  Find text", ":Telescope live_grep<CR>"),
    dashboard.button("<leader> v e", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("<leader> P s", "  Update Plugins", ":PackerSync<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- Which-key mappings
local mappings = {
    o = {
        d = { ":Alpha<CR>", "  Dashboard" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>" })
