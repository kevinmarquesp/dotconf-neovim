--- Tema com uma paleta de cores relaxante que gosto muito, pra combinar com o
--- restante do meu setup
local PlugNord = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugNord.get()
    return {
        "shaunsingh/nord.nvim",

        dependencies = {
            "lukas-reineke/indent-blankline.nvim",
            "akinsho/bufferline.nvim",
        },

        config = function()
            require('nord').set()
            require("ibl").setup({})

            -- Configurações do bufferline
            -- ----------------------------------------------------------------
            vim.schedule(function()
                require("bufferline").setup({
                    options = {
                        max_prefix_length = 20, -- prefix used when a buffer is de-duplicated
                        max_name_length = 20,

                        -- can also be a table containing 2 custom separators
                        -- [focused and unfocused]. eg: { '|', '|' }

                        separator_style = 'thin',
                        always_show_bufferline = true,
                        enforce_regular_tabs = true,
                        show_buffer_close_icons = false,
                        show_tab_indicators = true,
                        show_buffer_icons = true, -- disable filetype icons for buffers
                        show_close_icon = false,

                        diagnostics_indicator = function(count)
                            return '['..count..']'
                        end,

                        offsets = {{
                            filetype = 'NvimTree',
                            text = 'File Explorer',
                        }},

                        indicator = {
                            style = 'icon',
                            icon = ' ',
                        },
                    },
                })
            end)
        end
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugNord.after()
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    vim.cmd('colorscheme nord')
end

return PlugNord
