-- Which-key mappings
local mappings = {
    t = {
        t = { ":Twilight<cr>", "Toggle Twilight" },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })