local plug_list = {}

table.insert(plug_list, "kyazdani42/nvim-web-devicons")
table.insert(plug_list, "tpope/vim-surround")

table.insert(plug_list, require('plugins.p_emmet'))
table.insert(plug_list, require('plugins.c_editor_style'))

return plug_list