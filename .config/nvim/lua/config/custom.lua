vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.b[buf].ministatusline_disable = true

        vim.cmd.colorscheme "catppuccin"
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-group", { clear = true }),
    callback = function(args)
        local lsp = vim.lsp
        local builtin = require('telescope.builtin')
        local buffer = args.buf
        local keymap = vim.keymap
        keymap.set("n", "K", function()
                lsp.buf.hover({ border = "rounded" })
            end,
            { buffer = buffer }
        )
        keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buffer, desc = "Go to LSP definition" })
    end,
    desc = "Setup LSP config on attach",
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     desc = "Disable statusline on start screen",
--     group = vim.api.nvim_create_augroup("disable-statusline-startscreen", { clear = true }),
--     callback = function()
--         local buf = vim.api.nvim_get_current_buf()
--         print(vim.inspect(buf))
--         -- print(vim.bo.file)
--         -- if vim.bo[buf].filetype == 'alpha' then
--         --     vim.b[buf].ministatusline_disable = true
--         -- end
--     end
-- })
