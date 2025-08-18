return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- Load your custom component
            local cc_spinner = require('lualine.component'):extend()

            cc_spinner.processing = false
            cc_spinner.spinner_index = 1

            local spinner_symbols = {
                "⠋", "⠙", "⠹", "⠸", "⠼",
                "⠴", "⠦", "⠧", "⠇", "⠏",
            }
            local spinner_symbols_len = #spinner_symbols

            function cc_spinner:init(options)
                cc_spinner.super.init(self, options)

                local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

                vim.api.nvim_create_autocmd("User", {
                    pattern = "CodeCompanionRequest*",
                    group = group,
                    callback = function(request)
                        if request.match == "CodeCompanionRequestStarted" then
                            self.processing = true
                        elseif request.match == "CodeCompanionRequestFinished" then
                            self.processing = false
                        end
                    end,
                })
            end

            function cc_spinner:update_status()
                if self.processing then
                    self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
                    return spinner_symbols[self.spinner_index] .. " CC"
                end
                return ""
            end

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000, -- refresh every second
                    },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    -- Insert spinner at the start of lualine_x
                    lualine_x = {
                        cc_spinner, -- our custom component
                        'encoding', 'fileformat', 'filetype'
                    },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            }
        end
    }
}
