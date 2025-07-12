vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
local function show_layout_popup(message)
    -- Create a scratch buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Set buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { message })

    -- Calculate width & height based on message length
    local width = #message + 4
    local height = 1

    -- Window options
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2,
        row = 1,
        style = "minimal",
        border = "rounded",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, false, opts)

    -- Close after 2 seconds (2000 ms)
    vim.defer_fn(function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end, 2000)
end

local function is_russian_layout()
    local script_path = vim.fn.stdpath("config") .. "/get_layout.sh"
    local layout = vim.fn.system(script_path)
    layout = vim.trim(layout)
    return layout:match('ru')
end
vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
        if is_russian_layout() then
            show_layout_popup("Russian layout detected.")
        end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.b[buf].ministatusline_disable = true

        vim.cmd.colorscheme "everforest"
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
