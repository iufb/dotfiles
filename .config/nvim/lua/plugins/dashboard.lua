return {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "kyazdani42/nvim-web-devicons" } },
    config = function()
        local function default_header()
            return {
                '', '', '',
                '', '', '',
                '', '', '',
                '', '', '',
                '██╗  ██╗██╗   ██╗██╗  ██╗    ██╗██╗   ██╗',
                '██║  ██║██║   ██║██║  ██║    ██║██║   ██║',
                '███████║██║   ██║███████║    ██║██║   ██║',
                '██╔══██║██║   ██║██╔══██║    ██║██║   ██║',
                '██║  ██║╚██████╔╝██║  ██║    ██║╚██████╔╝',
                '╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝ ╚═════╝ ',
                '', '', '',
            }
        end


        require('dashboard').setup {
            theme = 'doom',
            config = {
                header = default_header(),
                center = {
                    {
                        icon = '󰙅 ',
                        icon_hl = 'Title',
                        desc = 'File browser',
                        desc_hl = 'String',
                        key = 'e',
                        key_hl = 'Number',
                        action = ':Telescope file_browser'
                    }, {
                    icon = '󰈞 ',
                    icon_hl = 'Title',
                    desc = 'Find files',
                    desc_hl = 'String',
                    key = 'f',
                    key_hl = 'Number',
                    action = ':Telescope find_files'
                }, {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find text',
                    desc_hl = 'String',
                    key = 'w',
                    key_hl = 'Number',
                    action = ':Telescope live_grep'
                },
                    {
                        icon = '',
                        icon_hl = 'Title',
                        desc = ' Close',
                        desc_hl = 'String',
                        key = 'q',
                        key_hl = 'Number',
                        action = ':q!'
                    },

                },
                footer = {} --your footer
            }
        }
    end
}
