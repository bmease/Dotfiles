local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.gitsigns
}

null_ls.setup({ sources = sources })
