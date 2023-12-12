--- Função básica de configuração, o que você colocaria no plug.config() deve
--- estar aqui; o famosos require("plug_name").setup()
local function plug_setup()
    vim.g.user_emmet_install_global = false
    vim.g.user_emmet_leader_key = ","
end

--- Essa função serve para você separar a configuração do plugin de algumas
--- customizações e detalhes que estão mais próximos do usuário final, como
--- keymaps e similares
local function user_setup()
    local user_group = vim.api.nvim_create_augroup("UserGroup",
    { clear = true })

    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = user_group,
        command = "EmmetInstall",
        pattern = {
            "*.html", "*.css", "*.js",  "*.scss",  "*.sass", "*.md",
            "*.ts",   "*.jsx", "*.tsx", "*.astro", "*.vue",
        },
    })
end

-- Conjunto de keymaps para agilizar um pouco a edição de arquivos em HTML,
-- similar ao Visual Studio Code
return {
    "mattn/emmet-vim",

    config = function()
        plug_setup()
        vim.schedule(user_setup)
    end,
}
