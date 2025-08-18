-- Failed to run `config` for blink.cmp
--
-- ...hare/nvim/lazy/blink.cmp/lua/blink/cmp/config/keymap.lua:168: `keymap.cmdline` has been replaced with `cmdline.keymap`
--
-- # stacktrace:
--   - /blink.cmp/lua/blink/cmp/config/keymap.lua:168 _in_ **validate**
--   - /blink.cmp/lua/blink/cmp/config/init.lua:51 _in_ **validate**
--   - /blink.cmp/lua/blink/cmp/config/init.lua:116 _in_ **merge_with**
--   - /blink.cmp/lua/blink/cmp/init.lua:20 _in_ **setup**
--   - ~/.config/nvim/lua/config/lazy.lua:21
--   - init.lua:2
return {

    {
        'saghen/blink.cmp',

        version = 'v0.*',

        dependencies = {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end
        },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {

            completion = {
                list = {
                    selection = {
                        auto_insert = true
                    },
                },
                documentation = {
                    auto_show               = true,
                    auto_show_delay_ms      = 150,
                    treesitter_highlighting = false
                }
            },
            keymap = {
                preset = 'enter',
            },
            cmdline = {
                keymap = {
                    preset = 'default',
                    ['<C-;>'] = { 'accept' },
                    ['<C-p>'] = { 'select_prev', 'fallback' },
                    ['<C-n>'] = { 'select_next', 'fallback' },
                }

            },
            snippets = {
                expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return require('luasnip').jumpable(filter.direction)
                    end
                    return require('luasnip').in_snippet()
                end,
                jump = function(direction) require('luasnip').jump(direction) end,
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',

            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },

            },

        },
        opts_extend = { "sources.default" }
    },
}
