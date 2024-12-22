return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" }, -- Ensure dependency order
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = Lsp_servers,
            })
        end,
    },
}
