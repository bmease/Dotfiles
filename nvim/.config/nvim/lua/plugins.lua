-- TODO: [Basic Customisations](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations)


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins to consider:
--  - Neogen
--      https://github.com/danymat/neogen
--      A better annotation generator. Supports multiple languages and annotation conventions.
--
--

return require('packer').startup({function(use)
    local config = function(name)
        return string.format("require('plugins.%s')", name)
    end

    local use_with_config = function(path, name, ...)
        use({ path, config = config(name), ... })
    end

    -- Packer can manage itself
    -- use 'wbthomason/packer.nvim'
    use_with_config("wbthomason/packer.nvim", "packer")

    -- Jellybeans
    -- A colorful, dark color scheme for Vim
    use 'nanotech/jellybeans.vim'

    use {
        'metalelf0/jellybeans-nvim',
        requires = { 'rktjmp/lush.nvim' },
        config = function()
            -- Fix highlights not working for git signs
            -- vim.cmd([[highlight DiffAdd     guibg=#151515 guifg=#70b950 ctermbg=none]])
            -- vim.cmd([[highlight DiffChange  guibg=#151515 guifg=#dad085 ctermbg=none]])
            -- vim.cmd([[highlight DiffDelete  guibg=#151515 guifg=#ff0303 ctermbg=none]])
        end
    }

    -- Tokyonight
    -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins
    -- use 'folke/tokyonight.nvim'
    use_with_config("folke/tokyonight.nvim", "tokyonight")

    use "rafamadriz/neon"

    use 'marko-cerovac/material.nvim'

    use "catppuccin/nvim"

    -- Nvim-web-devicons
    -- Adds file type icons to Vim plugins
    use 'kyazdani42/nvim-web-devicons'

    -- Artify
    -- Change the display of characters without changing font
    use 'sainnhe/artify.vim'


    -- Shade
    -- Dim inactive windows
    use_with_config("sunjon/shade.nvim", "shade")

    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            require("plugins/lualine")
        end
    })

    -- Nvim Treesitter
    -- An incremental parsing system for programming tools
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("plugins/nvim-treesitter")
        end,
        run = ':TSUpdate'
    })

    -- Rainbow parentheses powered by tree-sitter
    use {
        'p00f/nvim-ts-rainbow',
        after = {'nvim-treesitter'}
    }

    -- Textobjects defined by tree-sitter queries
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = {'nvim-treesitter'},
    }


    -- Beacon
    -- Flash cursor when moving
    use_with_config("danilamihailov/beacon.nvim", "beacon")


    -- Neo Smooth Scroll
    -- Smooth scroll plugin for neovim
    use 'cossonleo/neo-smooth-scroll.nvim'

    -- Winresizer
    -- Easy resizing of vim windows
    --
    -- FIXME: Issues with Control-D resizing windows even though the
    -- keybinding isn't set.
    --
    -- use {
    --     'simeji/winresizer',
    --     config = function()
    --         require('plugins/winresizer')
    --     end
    -- }

    -- Vim Cool
    -- Disable search highlight automatically
    use 'romainl/vim-cool'

    -- Vim Signature
    -- Plugin to toggle, display and navigate marks
    use_with_config("kshenoy/vim-signature", "vim-signature")

    -- Comment
    -- Smart and powerful comment plugin for neovim
    use_with_config("numToStr/Comment.nvim", "comment")

    -- FIXME: Not working with latest neovim: https://github.com/AndrewRadev/splitjoin.vim/issues/178
    use_with_config("AndrewRadev/splitjoin.vim", "splitjoin")

    -- Todo Comments
    -- Highlight, list and search todo comments in your projects
    use_with_config("folke/todo-comments.nvim", "todo-comments")

    -- Git Signs
    -- Git integration for buffers
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
          require('gitsigns').setup({
              signs = {
                  add = { text='' },
                  change = { text='' },
                  delete = { text='' }
              }
          })
      end
    }

    -- Vim Sandwich
    -- Set of textobject plugins to search/select/edit sandwiched textobjects
    use_with_config("machakann/vim-sandwich", "vim-sandwich")

    -- Telescope
    -- A highly extendable fuzzy finder over lists
    use({
        "nvim-telescope/telescope.nvim",
    	requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("plugins/telescope")
        end
    })


    -- Fugitive
    -- A Git wrapper so awesome, it should be illegal
    use_with_config("tpope/vim-fugitive", "fugitive")

    -- Which Key
    -- Displays a popup with possible keybindings of the command you started typing
    use_with_config("folke/which-key.nvim", "which-key")

    -- Zen Mode
    -- Distraction-free coding
    use_with_config("folke/zen-mode.nvim", "zen-mode")

    -- Twilight
    -- Dims inactive portions of the code you're editing using TreeSitter
    use_with_config("folke/twilight.nvim", "twilight")

    -- Maximizer
    -- Maximizes and restores the current windows
    use_with_config("szw/vim-maximizer", "vim-maximizer")

    -- LSP
    use_with_config("neovim/nvim-lspconfig", "lsp")

    -- Null-ls
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use "jose-elias-alvarez/null-ls.nvim"

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use_with_config("hrsh7th/nvim-cmp", "nvim-cmp")

    use_with_config("williamboman/nvim-lsp-installer", "nvim-lsp-installer")

    -- Trouble
    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
-- end})
end,

-- Packer config
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})
