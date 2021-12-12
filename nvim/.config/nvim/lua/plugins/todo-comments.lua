require("todo-comments").setup()

-- Which-key mappings
mappings = {
    o = {
        t = {
            name = "Open Project Todos",
            t = { ":TodoTrouble<cr>", "Open Todos in Trouble" },
            q = { ":TodoQuickFix<cr>", "Open Todos in Quickfix List" },
            l = { ":TodoLocList<cr>", "Open Todos in Location List" }
        },
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix="<leader>", mode = "n" })
