require('gitsigns').setup({
  signs = {
      -- add = { text='' },
      -- change = { text='' },
      -- delete = { text='' }
      add = { text='▌' },
      change = { text='▌' },
      delete = { text='▌' }
  }
})


-- Which-key mappings
local wk = require("which-key")

local nmappings = {
  ['['] = {
    c = { "<cmd>Gitsigns next_hunk<CR>", "next hunk" }
  },
  [']'] = {
    c = { "<cmd>Gitsigns prev_hunk<CR>", "previous hunk" }
  }
}

local leaderMappings = {
  h = {
    s = { "<cmd>Gitsigns stage_hunk<CR>", "stage hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "undo stage hunk" },
    S = { "<cmd>Gitsigns stage_buffer<CR>", "stage buffer" },
    r = { "<cmd>Gitsigns reset_hunk<CR>", "reset hunk" },
    R = { "<cmd>Gitsigns reset_buffer<CR>", "reset buffer" }
  }
}

wk.register(nmappings, { mode = "n" })
wk.register(leaderMappings, { prefix = "<leader>", mode = "n" })
