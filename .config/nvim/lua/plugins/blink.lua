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
                documentation = {
                    auto_show               = true,
                    auto_show_delay_ms      = 150,
                    treesitter_highlighting = false
                }
            },
            keymap = {
                preset = 'default',
                ['<C-y>'] = {},

                ['<C-;>'] = { 'accept' },
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
