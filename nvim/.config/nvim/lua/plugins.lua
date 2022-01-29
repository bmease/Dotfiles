-- TODO: [Basic Customisations](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations)
-- TODO: Install [iswap](https://github.com/mizlan/iswap.nvim)
-- TODO: Install [vim-move](https://github.com/matze/vim-move)
-- TODO: Consider installing [specs](https://github.com/edluffy/specs.nvim)
-- TODO: Consider installing neogit
-- FIXME: Consider getting rid of floatterm for fugitive
-- TODO: Install [vim-submode](https://github.com/kana/vim-submode)
-- TODO: Install vim-wiki
-- TODO: Install [Codi](https://github.com/metakirby5/codi.vim)
-- TODO: Install []()

-- Plugins to consider:
--
--


local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function(use)
    local config = function(name)
        return string.format("require('plugins.%s')", name)
    end

    --- Packer use with config in a separate file.
    --
    --- @param package string - Path to the package to install.
    --- @param filename string - Name of config file located in `lua/plugins/`.
    --- @param options table - Additional options to include.
    local use_with_config = function(package, filename, options)
        options = options or {}

        local params = { package, config = config(filename) }

        for key, value in ipairs(options) do
            params[key] = value
        end

        use(params)
    end

    -- Packer can manage itself
    -- use 'wbthomason/packer.nvim'
    use_with_config("wbthomason/packer.nvim", "packer")

    use "nvim-lua/plenary.nvim"

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
    use 'delphinus/artify.nvim'

    -- Bufferline
    -- A snazzy bufferline for Neovim
    use_with_config(
        "akinsho/bufferline.nvim",
        "bufferline",
        { requires = {'kyazdani42/nvim-web-devicons'} }
    )

    -- Shade
    -- Dim inactive windows
    -- use_with_config("sunjon/shade.nvim", "shade")

    -- Alpha Nvim
    -- Lua powered greeter like vim-startify / dashboard-nvim
    use_with_config("goolord/alpha-nvim", "alpha-nvim")

    -- Lualine LSP Progress
    -- LSP Progress lualine componenet
    use "arkav/lualine-lsp-progress"

    -- Lualine
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    use_with_config(
        "nvim-lualine/lualine.nvim",
        "lualine",
        { requires = {"kyazdani42/nvim-web-devicons", opt = true} }
    )

    -- Nvim Treesitter
    -- An incremental parsing system for programming tools
    use_with_config(
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter",
        { run = ':TSUpdate' }
    )

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

    -- Treesitter powered spellchecker
    use 'lewis6991/spellsitter.nvim'

    -- nvim-ts-context-commentstring
    -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- nvim-ts-autotag
    -- Use treesitter to auto close and auto rename html tag
    use 'windwp/nvim-ts-autotag'

    -- Symbols outline
    -- A tree like view for symbols in Neovim using the Language Server Protocol
    use_with_config("simrat39/symbols-outline.nvim", "symbols-outline")

    -- Vim Sleuth
    -- Heuristically set buffer options
    use 'tpope/vim-sleuth'

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
    use_with_config(
      "lewis6991/gitsigns.nvim",
      "gitsigns",
      { requires = "nvim-lua/plenary.nvim" }
    )

    -- Vim Sandwich
    -- Set of textobject plugins to search/select/edit sandwiched textobjects
    use_with_config("machakann/vim-sandwich", "vim-sandwich")

    -- Telescope
    -- A highly extendable fuzzy finder over lists
    use_with_config(
        "nvim-telescope/telescope.nvim",
        "telescope",
        { requires = {"nvim-lua/plenary.nvim"} }
    )

    -- Fugitive
    -- A Git wrapper so awesome, it should be illegal
    use_with_config("tpope/vim-fugitive", "fugitive")

    -- FloatTerm
    -- Terminal manager for (neo)vim
    use_with_config("voldikss/vim-floaterm", "vim-floaterm")

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

    -- Nvim Autopairs
    -- A super powerful autopair plugin for Neovim
    use_with_config('windwp/nvim-autopairs', 'nvim-autopairs')

    -- Quickfix Reflector
    -- Change code right in the quickfix window
    use "stefandtw/quickfix-reflector.vim"

    -- Neogen
    -- A better annotation generator.
    use_with_config(
        "danymat/neogen",
        "neogen",
        { requires = "nvim-treesitter/nvim-treesitter" }
    )

    -- LSP
    use_with_config("neovim/nvim-lspconfig", "lsp")

    -- LSP Signature
    -- LSP signature hint as you type
    use "ray-x/lsp_signature.nvim"

    -- Null-ls
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- TODO: Add sources
    use_with_config("jose-elias-alvarez/null-ls.nvim", "null-ls")

    -- Nvim Cmp
    -- A completion plugin for neovim coded in Lua.
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use_with_config("hrsh7th/nvim-cmp", "nvim-cmp")

    -- Friendly Snippets
    -- Set of preconfigured snippets for different languages
    use "rafamadriz/friendly-snippets"

    -- Nvim LSP Installer
    use_with_config("williamboman/nvim-lsp-installer", "nvim-lsp-installer")

    -- Trouble
    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing
    use_with_config(
        "folke/trouble.nvim",
        "trouble",
        { requires = "kyazdani42/nvim-web-devicons" }
    )

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
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
