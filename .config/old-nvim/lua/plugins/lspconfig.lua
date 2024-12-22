function TemplFormat()
	if vim.bo.filetype == "templ" then
		local bufnr = vim.api.nvim_get_current_buf()
		local filename = vim.api.nvim_buf_get_name(bufnr)
		local cmd = "templ fmt " .. vim.fn.shellescape(filename)

		vim.fn.jobstart(cmd, {
			on_exit = function()
				-- Reload the buffer only if it's still the current buffer
				if vim.api.nvim_get_current_buf() == bufnr then
					vim.cmd("e!")
				end
			end,
		})
	else
		vim.lsp.buf.format()
	end
end

return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local lspconfig = require("lspconfig")
		vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
		lspconfig.pyright.setup({})
		lspconfig.jsonls.setup({})
		lspconfig.gopls.setup({
			on_attach = function()
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
				vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<c-j>", vim.diagnostic.goto_next, { buffer = 0 })
				vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev, { buffer = 0 })
			end,
		})

		lspconfig.templ.setup({
			on_attach = function()
				vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = TemplFormat })
			end,
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			filetypes = { "templ", "astro", "javascript", "typescript", "react", "typescriptreact", "javascriptreact" },
			init_options = { userLanguages = { templ = "html" } },
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		lspconfig.htmx.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})
		lspconfig.prismals.setup({})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.astro.setup({
			cmd = { "astro-ls", "--stdio" },
			filetypes = { "astro" },
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
	end,
}
