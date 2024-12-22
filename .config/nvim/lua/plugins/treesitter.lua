return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "typescript",
                "lua",
                "vim",
                "tsx",
                "javascript",
                "json",
                "regex",
                "templ",
                "markdown",
                "markdown_inline",
            },
            sync_install = false,
            ignore_install = {},
            modules = {},
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}
