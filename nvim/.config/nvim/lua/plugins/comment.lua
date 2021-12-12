require('Comment').setup()

-- TODO: add commentstring support https://github.com/numToStr/Comment.nvim#-hooks

-- Which-key mappings
nMappings = {
    g = {
        b = { "Toggle linewise comment" },
        c = { "Toggle blockwise comment" },
    },
}

vMappings = {
    g = {
        b = { "Toggle linewise comment over range" },
        c = { "Toggle blockwise comment over range" },
    },
}

local wk = require("which-key")
wk.register(nMappings, { mode = "n" })
wk.register(vMappings, { mode = "v" })
