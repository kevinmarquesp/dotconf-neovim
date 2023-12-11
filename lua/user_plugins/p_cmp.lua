--- {{ descrição curta sobre esse plugin }}
local PlugCmp = {}

--- Essa função deve retornar uma tabela compatível com o lazy.nvim para ele
--- usar essas informações para baixar o plugin na sua máquina
--- -- Go back and update ~/.config/nvim/lua/plug_list.lua
function PlugCmp.get()
    return {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local status_ok, cmp, luasnip

            status_ok, cmp = pcall(require, "cmp")
            if not status_ok then
                print("nvim-cmp :: couldn't fint that plugin installed")
                return
            end

            status_ok, luasnip = pcall(require, "luasnip")
            if not status_ok then
                print("luasnip :: couldn't fint that plugin installed")
                return
            end

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = "path" },
                    { name = "buffer" },
                }),

                mapping = {
                    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4),  { 'i', 'c' }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-y>'] = cmp.config.disable,

                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),

                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
            }

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                sources = {{ name = 'buffer' }},
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
            })

        end
    }
end

--- Configurações e customizações que são mais próximas do usuário final, como
--- como keymapings ou coisa parecida
--- -- Go back and update ~/.config/nvim/lua/plug_after.lua
function PlugCmp.after()
end

return PlugCmp
