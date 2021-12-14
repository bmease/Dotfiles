-- Which-key mappings
local mappings = {
    o = {
        b = { "<cmd>Telescope buffers<CR>", "Open Buffer" },
        f = { "<cmd>Telescope find_files<CR>", "Open File By Name" },
        g = { "<cmd>Telescope live_grep<CR>", "Open File By Grep" },
        h = { ":topleft Telescope help_tags<CR>", "Open Help" },
        r = { "<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>", "Open Recent File" },
    },

    g = {
        l = {
            b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "List branches" },
            c = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "List commits" },
            C = { "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", "List commits for current buffer" },
            s = { "<cmd>lua require('telescope.builtin').git_stash()<CR>", "List stash items" },
        }
    }
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
