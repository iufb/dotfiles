return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
        local keymap = vim.keymap
        -- keymap.set("n", "mm", "<cmd>TSToolsOrganizeImports<cr>")
        -- keymap.set("n", "<C-n>", "<cmd>TSToolsAddMissingImports<cr>")

        local api = require("typescript-tools.api")
        require("typescript-tools").setup({
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
                vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = 0 })
                vim.keymap.set("n", "<c-j>", vim.diagnostic.goto_next, { buffer = 0 })
                vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev, { buffer = 0 })
            end,

            handlers = {
                ["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }),
                ["textDocument/rename"] = api.rename,
            },
            settings = {
                tsserver_file_preferences = {
                    importModuleSpecifierPreference = "non-relative",
                },
            },
        })
    end,
}
