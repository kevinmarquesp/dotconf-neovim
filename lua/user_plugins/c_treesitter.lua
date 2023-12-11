--- Jeito melhor e mais rápido de pintar a sintaxe das linguagens mais famosas
--- e lidar com a identação
local PlugTreesitter = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugTreesitter.get()
    return {
        "nvim-treesitter/nvim-treesitter",

        dependencies = {
            "tpope/vim-commentary",
            "windwp/nvim-autopairs",
            "lewis6991/gitsigns.nvim",
        },

        config = function()
            local status_ok, nvim_treesitter_configs = pcall(require,
                "nvim-treesitter.configs")
            if not status_ok then
                print("treesitter :: couldn't find this plugin")
                return
            end

            local nvim_autopairs
            status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
            if not status_ok then
                print("autopairs :: couldn't find this plugin")
                return
            end

            local gitsigns
            status_ok, gitsigns = pcall(require, "gitsigns")
            if not status_ok then
                print("gitsigns :: couldn't find this plugin")
                return
            end

            -- Configurações básicas do Treesitter
            -- ----------------------------------------------------------------
            nvim_treesitter_configs.setup({
                sync_install = true,

                highlight = {
                    enable = true,
                    disable = { 'html', 'vim', 'vue' },
                    additional_vim_regex_highlighting = true,
                },

                indent = {
                    enable = true,
                    disable = { 'scss', 'css', 'sass' },
                },
            })

            -- Configurações do autopairs
            -- ----------------------------------------------------------------
            nvim_autopairs.setup()

            -- Configurações do gitsigns
            -- ----------------------------------------------------------------
            gitsigns.setup({
                signs = {
                    add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
                    change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
                    delete       = { hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
                    topdelete    = { hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
                    changedelete = { hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' }
                }
            })
        end,
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugTreesitter.after()
    vim.keymap.set("n", "<cr>", ":Commentary<cr>")
    vim.keymap.set("v", "<cr>", ":'<'>Commentary<cr>")
end

return PlugTreesitter
