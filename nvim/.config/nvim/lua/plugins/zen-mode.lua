-- Which-key mappings
mappings = {
    t = {
        z = { ":ZenMode<cr>", "Toggle Zen Mode" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
