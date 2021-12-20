-- TODO: [Automatically install LSP servers](https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#automatically-install-lsp-servers)

local nmap = require('utils').nmap

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- local function on_attach(client, bufnr)
--     nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- end

local lsp = require("plugins/lsp")

lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local default_opts = {
        on_attach = lsp.on_attach,
        handlers = lsp.handlers
    }

    -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
    local server_opts = {
        ["eslintls"] = function()
            default_opts.settings = {
                on_attach = function(client, bufnr)
                    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
                    -- the resolved capabilities of the eslint server ourselves!
                    client.resolved_capabilities.document_formatting = true
                    lsp.on_attach(client, bufnr)
                end,
                format = {
                    enable = true,
                }
            }
        end,
    }

    -- Use the server's custom settings, if they exist, otherwise default to the default options
    local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
    server:setup(server_options)
end)


-- Which-key mappings
local mappings = {
    l = {
        I = { ":LspInstallInfo<cr>", "Language Servers Installed Info" }
    },
}

local wk = require("which-key")
wk.register(mappings, { prefix = "<leader>", mode = "n" })
