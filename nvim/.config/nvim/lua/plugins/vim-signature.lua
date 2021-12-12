-- Which-key mappings
mappings = {
    t = {
        m = { ":SignatureToggle<cr>", "Toggle Marks" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
