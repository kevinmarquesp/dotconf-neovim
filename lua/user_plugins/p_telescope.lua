--- Simplesmente o mmelhor plugin para fuzzy file search disponível para
--- usuário de Neovim (juntamente com a melhor configuração)
local PlugTelescope = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugTelescope.get()
    return {
        "nvim-telescope/telescope.nvim",

        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local status_ok, telescope = pcall(require, "telescope")
            if not status_ok then
                print("telescope :: couldn't find that plugin")
                return
            end

            local actions = require("telescope.actions")
            local sorters = require("telescope.sorters")
            local previewers = require("telescope.previewers")

            telescope.setup({
                defaults = {
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",

                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",

                    file_sorter = sorters.get_fuzzy_file,
                    generic_sorter = sorters.get_generic_fuzzy_sorter,

                    file_ignore_patterns = { "node_modules" },
                    path_display = { "truncate" },

                    color_devicons = true,
                    use_less = true,

                    set_env = { ["COLORTERM"] = "truecolor" },
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

                    buffer_previewer_maker = previewers.buffer_previewer_maker,
                    qflist_previewer = previewers.vim_buffer_qflist.new,
                    grep_previewer = previewers.vim_buffer_vimgrep.new,
                    file_previewer = previewers.vim_buffer_cat.new,

                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-l>"] = actions.close,
                            ["<C-p>"] = actions.close,
                        },
                    },

                    vimgrep_arguments = { "rg", "--color=never",
                        "--no-heading", "--with-filename", "--line-number",
                        "--column", "--smart-case" },
                },

                pickers = {
                    git_commits = { theme = "dropdown" },
                    git_status = { theme = "dropdown" },
                    grep_string = { theme = "dropdown" },
                    find_files = { theme = "dropdown" },
                    buffers = { theme = "dropdown" },
                    marks = { theme = "dropdown" },
                },
            })
        end,
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugTelescope.after()
    local status_ok, telescope_builtin = pcall(require, "telescope.builtin")
    if not status_ok then
        return
    end

   vim.keymap.set("n", "<c-p>",      telescope_builtin.find_files)
   vim.keymap.set("n", "<leader>p",  telescope_builtin.buffers)
   vim.keymap.set("n", "<leader>fc", telescope_builtin.git_commits)
   vim.keymap.set("n", "<leader>fs", telescope_builtin.git_status)
   vim.keymap.set("n", "<leader>fm", telescope_builtin.marks)
   vim.keymap.set("n", "<leader>?",  ":Telescope keymaps<cr>")
end

return PlugTelescope
