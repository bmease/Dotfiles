-- Which-key mappings
local mappings = {
    o = {
        b = { "<cmd>Telescope buffers<cr>", "Open Buffer" },
        f = { "<cmd>Telescope find_files<cr>", "Open File By Name" },
        g = { "<cmd>Telescope live_grep<cr>", "Open File By Grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Open Help" },
        n = { "<cmd>Telescope file_browser<cr>", "Open File By Browsing" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
