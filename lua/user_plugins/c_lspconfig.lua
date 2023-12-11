--- {{ descrição curta sobre esse plugin }}
local PlugLspConfig = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugLspConfig.get()
    return {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            -- "j-hui/fidget.nvim",
        },

        config = function()
            local satus_ok, mason, neodev--, fidget

            status_ok, lspconfig = pcall(require, "lspconfig")
            status_ok, mason = pcall(require, "mason")
            status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
            status_ok, neodev = pcall(require, "neodev")
            -- status_ok, fidget = pcall(require, "fidget")

            if not status_ok then
                print("lspconfig :: error on setting everything up")
                return
            end

            mason.setup()
            neodev.setup()
            -- fidget.setup()

            local servers = {} -- default server to ensure that is installed

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers)
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup {
                        capabilities = capabilities,
                        -- on_attach = function(_, bufnr) return end,
                        settings = servers[server_name],
                    }
                end,
            })
        end
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugLspConfig.after()
end

return PlugLspConfig
