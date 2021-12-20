-- TODO: Add a [python repl](https://github.com/voldikss/vim-floaterm#python)
-- TODO: Add a javascript repl


local tmap = require('utils').tmap

-- Toggle terminal when escape is pressed
-- TODO: Use an [autocmd](https://github.com/voldikss/vim-floaterm#autocmd) to toggle escape
tmap("<esc>", [[<C-\><C-n>:FloatermToggle<CR>]])
-- tmap('<C-h>', [[<C-\><C-n><C-W>h]])
-- tmap('<C-j>', [[<C-\><C-n><C-W>j]])
-- tmap('<C-k>', [[<C-\><C-n><C-W>k]])
-- tmap('<C-l>', [[<C-\><C-n><C-W>l]])


-- Which-key mappings
local mappings = {
    g = {
        s = { ":FloatermNew --disposable --autoclose=2 nvim -c ':Git' +only<CR>", "  Git status" },
        c = { ":FloatermNew --disposable --autoclose=2 nvim -c ':Git commit' +only<CR>", "  Git commit" },
        C = { ":FloatermNew --disposable --autoclose=2 nvim -c ':Git commit --amend' +only<CR>", "  Git commit amend" },
    },

    o = {
        n = { [[:FloatermNew --disposable --opener=edit --title=Open\ File ranger<CR>]], "פּ  Open file by browsing" },
        p = { ":FloatermNew<CR>", "  Open terminal"}
    },

    t = {
        t = {
            name = " Terminal",
            t = { ":FloatermToggle<CR>", "  Toggle terminal" },
            n = { ":FloatermNext<CR>", "  Next terminal" },
            p = { ":FloatermPrev<CR>", "  Previous terminal" },
        },
    }
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
