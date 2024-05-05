return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local lspconfig = require("lspconfig")
		vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
		lspconfig.pyright.setup({})
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
		lspconfig.html.setup({})
		lspconfig.prismals.setup({})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.astro.setup({
			capabilities = capabilities,
		})
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
	end,
}
