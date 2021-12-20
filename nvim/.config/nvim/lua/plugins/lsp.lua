-- TODO: Add [code actions highlighting](https://github.com/neovim/nvim-lspconfig/wiki/Code-Actions)

require('lspconfig').pyright.setup({})
require("null-ls").setup({})

local nmap = require('utils').nmap


vim.diagnostic.config({
  virtual_text = {
    source = "always"
  },

  float = {
    source = "always",
    -- Doesn't work? not in help but other people use it?
    -- focusable = false,
    -- border = "rounded",
    -- style = "minimal"
  }
})


-- Change diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Which-key mappings
local leaderMappings = {
    l = {
        name = "Language Server",
        -- a = { "<cmd>Telescope lsp_code_actions<CR>", "Code Actions" },
        -- d = { "<cmd>Telescope lsp_definitions<CR>", "Goto Symbol Definition" },
        -- D = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        i = { ":LspInfo<cr>", "Language Server buffer info" },
        -- R = { "<cmd>Telescope lsp_references<CR>", "References" },
    },
}

local wk = require("which-key")
wk.register(leaderMappings, { prefix = "<leader>", mode = "n" })


-- Print diagnostics on cursor hold
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--   opts = opts or {}
--
--   bufnr = bufnr or 0
--   line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--
--   local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
--   if vim.tbl_isempty(line_diagnostics) then return end
--
--   local diagnostic_message = ""
--   for i, diagnostic in ipairs(line_diagnostics) do
--     diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--     print(diagnostic_message)
--     if i ~= #line_diagnostics then
--       diagnostic_message = diagnostic_message .. "\n"
--     end
--   end
--   vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
-- end
--
-- vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]


local M = {}

-- Border colors
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- Border icons
-- local border = {
--       {"┌", "FloatBorder"},
--       {"▔", "FloatBorder"},
--       {"🭾", "FloatBorder"},
--       {"▕", "FloatBorder"},
--       {"🭿", "FloatBorder"},
--       {"▁", "FloatBorder"},
--       {"🭼", "FloatBorder"},
--       {"▏", "FloatBorder"},
-- }
--
-- -- Handler function to enable borders with hover and signatureHelp
-- M.handlers = {
--   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
--   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
-- }

M.on_attach = function(client, bufnr)

    -- Highlight symbol under cursor
    if client.resolved_capabilities.document_highlight then
      vim.cmd [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
    end

    -- unmapped:
    -- nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- nmap('<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>')

    -- nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    -- nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    -- nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- nmap('gr', '<cmd>Telescope lsp_references<CR>')  -- nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')

    -- nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')


    -- Selects a code action available at the current cursor position.
    -- nmap('<leader>la', '<cmd>Telescope lsp_code_actions<CR>')  -- nmap('<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    -- Jumps to the definition of the type of the symbol under the cursor.
    -- nmap('<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

    -- Renames all references to the symbol under the cursor.
    -- nmap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    -- nmap('<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    -- nmap('<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- nmap('<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    -- nmap('<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    -- nmap('<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

    nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

    local bufMappings = {
        g = {
            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Jump to the declaration of the symbol" },
            D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Jump to the definition of the symbol" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "List all implementations of the symbol" },
            r = { "<cmd>Telescope lsp_references<CR>", "List all the references of the symbol" },
        },
        K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Display symbol hover information" },
    }

    local bufLeaderMappings = {
        l = {
            a = { "<cmd>Telescope lsp_code_actions<CR>", "Code actions" },
            D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format current buffer" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Add buffer diagnostics to location list" },
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
            w = {
                name = "Workspace",
                a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder" },
                r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
                l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders" },
            },
        }
    }

    wk.register(bufMappings, { mode = "n", buffer = bufnr })
    wk.register(bufLeaderMappings, { prefix = "<leader>", mode = "n", buffer = bufnr })
end


return M
