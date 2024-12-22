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
    end,
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
