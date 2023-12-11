--- {{ descrição curta sobre esse plugin }}
local PlugName = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugName.get()
    return {
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugName.after()
end

return PlugName
