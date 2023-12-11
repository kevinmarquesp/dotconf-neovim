--- Conjunto de keymaps para agilizar um pouco a edição de arquivos em HTML,
--- similar ao Visual Studio Code
local PlugEmmet = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugEmmet.get()
    return {
        "mattn/emmet-vim"
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugEmmet.after()
    vim.g.user_emmet_install_global = false
    vim.g.user_emmet_leader_key = ","

    local user_group = vim.api.nvim_create_augroup("UserGroup",
        { clear = true })

    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = user_group,
        command = "EmmetInstall",
        pattern = {
            "*.html",  "*.css",  "*.js",
            "*.scss",  "*.sass", "*.md",
            "*.ts",    "*.jsx",  "*.tsx",
            "*.astro", "*.vue",
        },
    })
end

return PlugEmmet
