local plug_list = {}

table.insert(plug_list, "kyazdani42/nvim-web-devicons")
table.insert(plug_list, "tpope/vim-commentary")
table.insert(plug_list, "tpope/vim-surround")

table.insert(plug_list, require("user_plugins.p_emmet").get())

return plug_list
