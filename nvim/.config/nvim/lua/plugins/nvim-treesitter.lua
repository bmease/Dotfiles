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
        enable = false
    },

    textObjects = {
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

            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },

            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        }
    },

    rainbow = {
        enable = true
    }
}

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
