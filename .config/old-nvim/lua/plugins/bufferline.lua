return {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {
        options = {
            mode = "tabs",
            separator_style = 'slant',
            always_show_bufferline = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            color_icons = true
        },
        highlights = {
            separator = {
                fg = '#4F5B58',
                bg = '#1e2326',
            },
            separator_selected = {
                fg = '#4F5B58',
            },
            background = {
                fg = '#657b83',
                bg = '#1e2326'
            },
            buffer_selected = {
                fg = '#e67e80',
                bold = true,
            },
            fill = {
                bg = '#4F5B58'
            }
        },
    }
}
