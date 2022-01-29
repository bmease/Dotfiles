require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },

    indent = {
        -- FIXME: Disabled due to issues where indentation doesn't work
        enable = true
    },

    textobjects = {
        --  text objects mappings similar to ip (inner paragraph) and
        --  ap (a paragraph)
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        },

        -- swap the node under the cursor with the next or previous one,
        -- like function parameters or arguments
        swap = {
            enable = true,
            -- The keymappings are set below with whichkey
        }
    },

    rainbow = {
        enable = true
    },

    context_commentstring = {
        enable = true
    },

    autotag = {
        enable = true,
    }
}


local wk = require("which-key")

local nmappings = {
    s = {
        name = "Swap",
        p = { ":TSTextobjectSwapNext @parameter.inner<CR>", "Swap Paramater" },
        P = { ":TSTextobjectSwapNext @parameter.outer<CR>", "Swap Paramater" },
    },
}

wk.register(nmappings, { prefix = "<leader>" })

local omappings = {
    a = {
        f = { "around function" },
        c = { "around class" }
    },
    i = {
        f = { "inside function" },
        c = { "inside class" }
    }
}

wk.register(omappings, { mode = "o" })

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
