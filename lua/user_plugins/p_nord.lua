--- Tema com uma paleta de cores relaxante que gosto muito, pra combinar com o
--- restante do meu setup
local PlugNord = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugNord.get()
    return {
        "shaunsingh/nord.nvim",

        config = function()
            require('nord').set()
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
