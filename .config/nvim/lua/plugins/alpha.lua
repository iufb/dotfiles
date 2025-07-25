local art = require('plugins.header_img.header1')

return {
    {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            position = 'center'
        },
        config = function()
            local startify = require("alpha.themes.startify")
            _Gopts = {
                position = "center",
                hl = "Type",
                wrap = "overflow",
            }
            startify.section.header = art.header
            startify.config.layout = {
                startify.section.header,
                { type = "padding", val = 2 },
            }


            startify.section.mru.val = { { type = "padding", val = 0 } }
            startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
            startify.section.top_buttons.val = {}
            startify.section.bottom_buttons.val = {}
            startify.section.footer.val = {}
            startify.file_icons.provider = "devicons"
            require("alpha").setup(
                startify.config
            )
        end,
    }, }
