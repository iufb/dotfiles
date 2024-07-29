local keymap = vim.keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
local function map(m, k, v)
	keymap.set(m, k, v, { silent = true })
end
map("x", "p", "P")
keymap.set("n", "x", '"_x')
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
keymap.set("n", "wq", ":noh<Return>")
-- Get current path of file
keymap.set("n", "cp", '<cmd>:echo expand("%:p")<CR>')
-- Delete a word
keymap.set("n", "dw", "vawc")
-- Set jk to Esc in insert mode
keymap.set("i", "jk", "<Esc>")
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- Disable notifications
keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>")

--Tabs
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

-- New tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
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
