-- Which-key mappings
local mappings = {
    g = {
        s = { "Sort" },
    },
}

local wk = require("which-key")
wk.register(mappings, { mode = "x" })
wk.register(mappings, { mode = "n" })
