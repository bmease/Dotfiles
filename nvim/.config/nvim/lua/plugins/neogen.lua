require('neogen').setup {
    enabled = true
}


-- Which-key mappings
local mappings = {
    d = {
        name = "Documentation",
        g = { ":lua require('neogen').generate()<CR>", "Generate Documentation" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>" })
