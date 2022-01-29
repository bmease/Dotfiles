
require('telescope').setup({
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      multi_icon = ' ',
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

   }
})


local highlight = require('utils').highlight
local colors = require("tokyonight.colors").setup()


highlight('TelescopeBorder', colors.bg_dark, colors.bg_dark)
highlight('TelescopePromptBorder', colors.bg_highlight, colors.bg_highlight)

highlight('TelescopePromptNormal', colors.fg_dark, colors.bg_highlight)
highlight('TelescopePromptPrefix', colors.red, colors.none)

highlight('TelescopeSelection', colors.purple, colors.bg_highlight)

highlight('TelescopePromptTitle', colors.red, colors.bg_highlight)
highlight('TelescopePreviewTitle', colors.red, colors.none)
highlight('TelescopeResultsTitle', colors.none, colors.none)


-- Which-key mappings
local mappings = {
    o = {
        b = { "<cmd>Telescope buffers<CR>", "  Open Buffer" },
        f = { "<cmd>Telescope find_files<CR>", "  Open File By Name" },
        g = { "<cmd>Telescope live_grep<CR>", "  Open File By Grep" },
        h = { ":topleft Telescope help_tags<CR>", "  Open Help" },
        r = { "<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>", "  Open Recent File" },
        u = { "<cmd>Telescope git_status<CR>", "  Open git files" },
    },

    g = {
        l = {
            b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "  List branches" },
            c = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "  List commits" },
            C = { "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", "  List commits for current buffer" },
            s = { "<cmd>lua require('telescope.builtin').git_stash()<CR>", "  List stash items" },
        }
    }
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
