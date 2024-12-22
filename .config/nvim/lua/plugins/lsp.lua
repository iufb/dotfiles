local formatOnSave = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end
            if client.supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        if includes(Ts_js, vim.bo.filetype) then
                            vim.cmd 'TSToolsOrganizeImports'
                            vim.cmd 'TSToolsAddMissingImports'
                        end
                    end
                })
            end
        end
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        "saghen/blink.cmp"
    },
    config = function()
        formatOnSave()
        local lspconfig = require('lspconfig')
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        for _, language in ipairs(Lsp_servers) do
            if language == 'ts_ls' then
                goto continue
            end
            lspconfig[language].setup {
                capabilities = capabilities
            }
            ::continue::
        end
    end
}
