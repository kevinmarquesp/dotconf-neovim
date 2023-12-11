local plug_list = {}

table.insert(plug_list, "kyazdani42/nvim-web-devicons")
table.insert(plug_list, "tpope/vim-surround")

table.insert(plug_list, require("user_plugins.p_nord").get())
table.insert(plug_list, require("user_plugins.p_emmet").get())
table.insert(plug_list, require("user_plugins.c_treesitter").get())
table.insert(plug_list, require("user_plugins.p_telescope").get())
table.insert(plug_list, require("user_plugins.p_cmp").get())
table.insert(plug_list, require("user_plugins.c_lspconfig").get())
table.insert(plug_list, require("user_plugins.p_lualine").get())

return plug_list
