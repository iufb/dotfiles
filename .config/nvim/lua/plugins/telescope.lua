return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            pickers = {
                find_files = {
                    theme = 'ivy',
                    hidden = true
                },
                live_grep = {
                    theme = 'dropdown'
                } },
            extensions = {
                fzf = {}
            } }
        telescope.load_extension "fzf"

        -- Mappings
        local builtin = require('telescope.builtin')
        local keymap = vim.keymap

        keymap.set("n", ';f', builtin.find_files)
        keymap.set("n", ';r', builtin.live_grep)
        keymap.set("n", 'grr', builtin.lsp_references)
        keymap.set("n", '<leader>fh', builtin.help_tags)
        keymap.set("n", '<leader>ec', function()
            builtin.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
    end
}
