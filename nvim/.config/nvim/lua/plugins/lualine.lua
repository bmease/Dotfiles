local artify = require('artify')

-- Breakpoints --
--                                                                                                                      120 (Full)
--                                                                                                  100 (Large)
--                                                                              80 (Medium)
--                                                          60 (SMALL)
--                                      40 (Very Small)
--                  20
--        10
--
local DEFAULT_WIDTH = 80
local FULL_BREAKPOINT = 120
local LARGE_BREAKPOINT = 100
local MEDIUM_BREAKPOINT = 80
local SMALL_BREAKPOINT = 60
local VERY_SMALL_BREAKPOINT = 40

--- Hide the component if the window width is below a certain threshold.
--- @param width number Width to hide component at or DEFAULT_WIDTH.
--- @return function Cond function.
local function hide_at(width)
    width = width or DEFAULT_WIDTH

    return function()
        return vim.fn.winwidth(0) > width
    end
end

local function toMonospace(str)
    return artify(str, 'monospace')
end


local diff = {
    "diff",
    -- symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_at(MEDIUM_BREAKPOINT)
}

local branch = {
    "branch",
    fmt = toMonospace,
    cond = hide_at(LARGE_BREAKPOINT),
}

local filename = {
    "filename",
    path = 1,
    shorting_target = SMALL_BREAKPOINT,
    fmt = toMonospace
}

local diagnostics = {
    "diagnostics",
    cond = hide_at(SMALL_BREAKPOINT)
}

local mode = {
    "mode",
    fmt = function(str)
        return vim.fn.winwidth(0) > SMALL_BREAKPOINT
            and toMonospace(str)
            or toMonospace(str:sub(1,1))
    end
}

local location = {
    function()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        return '' .. line .. ':' .. col
    end,
    cond = hide_at(VERY_SMALL_BREAKPOINT),
}

local progress = {
    "progress",
    padding = { left = 0, right = 1 },
    cond = hide_at(MEDIUM_BREAKPOINT),
}

local filetype = {
    "filetype",
    cond = hide_at(MEDIUM_BREAKPOINT),
}


local config = {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {mode},
        lualine_b = {branch, diff, diagnostics},
        lualine_c = {filename},
        lualine_x = {'lsp_progress', filetype},
        lualine_y = {location},
        lualine_z = {progress}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {filename},
        lualine_x = {location},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}

}


require("lualine").setup(config)
