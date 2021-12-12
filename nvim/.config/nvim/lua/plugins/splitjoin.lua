-- Which-key mappings
mappings = {
    g = {
        S = { "Split Into Multiple Lines" },
    },
}

local wk = require("which-key")
wk.register(mappings, { mode = "n" })
