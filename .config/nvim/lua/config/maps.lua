local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local function map(m, k, v)
    keymap.set(m, k, v, { silent = true })
end
map("x", "p", "P")
--paste
keymap.set("n", "gp", '"*p')
--codecompanion
keymap.set('n', '<leader>o', ':CodeCompanionChat Toggle<Return>')
keymap.set({ 'n', 'v' }, '<leader>i', ':CodeCompanion<Return>')

--harpoon

keymap.set("n", "<leader><Tab>", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap.set("n", "te", "<cmd>:lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "zj", "<cmd>:lua require('harpoon.ui').nav_next()<CR>")
keymap.set("n", "zk", "<cmd>:lua require('harpoon.ui').nav_prev()<CR>")
--quickfix
keymap.set("n", "<leader>cn", "<cmd>cnext<CR>")
keymap.set("n", "<leader>cp", "<cmd>cprevious<CR>")
keymap.set("n", "<leader>co", "<cmd>copen<CR>")
keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")
-- run shell command
keymap.set("n", "<leader>s", ":!")
keymap.set("n", "x", '"_x')
keymap.set("n", "j", "gj", { noremap = true, silent = true })
keymap.set("n", "k", "gk", { noremap = true, silent = true })
--zen mode
keymap.set("n", "<leader>z", ":ZenMode<Return>")
--DEBUG
keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F1>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- Delete highlight
keymap.set("n", "wq", "<cmd>:noh<CR>")
-- Get current path of file
keymap.set("n", "cp", '<cmd>:echo expand("%:p")<CR>')
-- Delete a word
keymap.set("n", "dw", "vawc")
-- Set jk to Esc in insert mode
keymap.set("i", "jk", "<Esc>")
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")


-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<left>", "<C-W><")
keymap.set("n", "<right>", "<C-W>>")
keymap.set("n", "<C-w><up>", "<C-W>+")
keymap.set("n", "<C-w><down>", "<C-W>-")
