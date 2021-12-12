-- Which-key mappings
mappings = {
    g = {
        name = "Git",
        s = { ":Git<cr>", "Git Status" },
        l = { ":Gclog<cr>", "Git Log" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>" })
