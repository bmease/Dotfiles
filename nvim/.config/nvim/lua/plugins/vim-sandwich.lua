
-- Which-key mappings
mappings = {
    s = {
        name = "surround",
        a = { "Add" },
        d = { "Delete" },
        r = { "Replace" }
    },
}

local wk = require("which-key")
wk.register(mappings, { mode = "n" })
wk.register(mappings, { mode = "v" })
