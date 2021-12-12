require('lspconfig').pyright.setup({})
require("null-ls").config({})


-- Which-key mappings
local mappings = {
    l = {
        name = "Language Server",
        i = { ":LspInfo<cr>", "Language Server Info" }
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
