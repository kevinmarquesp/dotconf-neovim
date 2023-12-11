local NEOVIM_CONFIG_PATH = os.getenv("HOME").."/.config/nvim"
local SHARED_CONFIG_PATH = NEOVIM_CONFIG_PATH.."/shared"
local SHARED_CONFIG_FILES = {
    "keymaps.vim",
    "commands.vim",
    "indentation_rules.vim",
    "settings.vim",
}

for _, file in ipairs(SHARED_CONFIG_FILES) do
    local vim_command = "source "..SHARED_CONFIG_PATH.."/"..file
    vim.cmd(vim_command)
end
