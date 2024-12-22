return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = function()
            local oil = require('oil')
            oil.setup {
                default_file_explorer = true,
                skip_confirm_for_simple_edits = true,
            }
            vim.keymap.set('n', "sf", '<cmd>Oil --float <CR>')
            vim.keymap.set('n', '<Esc>', function()
                if vim.bo.filetype == 'oil' then
                    local win = vim.api.nvim_get_current_win()
                    vim.api.nvim_win_close(win, false)
                end
            end)
        end
    }
}
