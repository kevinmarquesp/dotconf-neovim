local UserCommands = {}

function UserCommands._cmd_newplug()
    local NVIM_CONFIG_DIR = os.getenv("HOME").."/.config/nvim"
    local TEMPLATE_PATH = NVIM_CONFIG_DIR.."/templates/p_plugin.lua"
    local DEST_DIR = NVIM_CONFIG_DIR.."/lua/user_plugins"

    local file_name = vim.fn.input("Plugin file name: ")
    local plug_name = vim.fn.input("Plugin table name: ")

    os.execute("sed -e 's/PlugName/Plug"..plug_name.."/g' "..TEMPLATE_PATH..
        " > "..DEST_DIR.."/"..file_name..".lua")

    vim.cmd("edit "..DEST_DIR.."/"..file_name..".lua")
end

function UserCommands:load()
    vim.api.nvim_create_user_command('NewPlug', self._cmd_newplug, {})
end

return UserCommands
