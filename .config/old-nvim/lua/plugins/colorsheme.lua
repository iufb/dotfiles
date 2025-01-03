return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = false,
        },
        priority = 1000
    },
    {
        "sample-usr/rakis.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "sainnhe/everforest",       lazy = false },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            disable_background = true,
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    {
        "olivercederborg/poimandres.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("poimandres").setup({
                disable_background = true,
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            })
        end,
    },
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
}
