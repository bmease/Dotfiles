-- Which-key mappings
local mappings = {
    g = {
        S = { "Split Into Multiple Lines" },
        J = { "Join Multiple Lines" },
    },
}

local wk = require("which-key")
wk.register(mappings, { mode = "n" })
