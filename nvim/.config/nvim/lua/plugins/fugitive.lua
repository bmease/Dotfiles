-- Which-key mappings
local mappings = {
    g = {
        name = "Git",
        b = { ":Git blame<CR>", "Git blame" },
        l = {
            name = "List",
            l = { ":Gclog<CR>", "Git log" },
        }
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>" })
