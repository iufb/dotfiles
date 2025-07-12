local formatOnSave = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end
            if client:supports_method('textDocument/formatting') then
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
        local config = require('lspconfig.configs')
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local root_files = {
            "tsconfig.base.json",
            "tsconfig.json",
            "jsconfig.json",
            "package.json",
            ".git"
        }
        local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
        local root_dir = vim.fs.dirname(paths[1])

        if not config.tsgo then
            config.tsgo = {
                default_config = {
                    cmd = { "/home/iufb/Projects/typescript-go/built/local/tsgo", '--lsp', "--stdio" },
                    root_dir = root_dir,
                    filetypes = { "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact"
                    },
                },
            }
        end
        local skip_servers = {
            ts_ls = true,
            tsgo = true
        }
        for _, language in ipairs(Lsp_servers) do
            if not skip_servers[language] then
                lspconfig[language].setup {
                    capabilities = capabilities,
                }
            end
        end
    end
}
