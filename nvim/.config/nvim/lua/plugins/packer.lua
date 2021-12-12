
-- Which-key mappings
mappings = {
    P = {
        name = "Plugins",
        c = { "<cmd>PackerCompile<CR>", "Packer Compile" },
        i = { "<cmd>PackerInstall<CR>", "Packer Install" },
        r = { "<cmd>PackerClean<CR>", "Packer Clean" },
        s = { "<cmd>PackerSync<CR>", "Packer Sync" },
        u = { "<cmd>PackerUpdate<CR>", "Packer Update" },
    }
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })


-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
