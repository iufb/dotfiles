local function has_eslint_config(root_dir)
	local eslint_config_files = {
		".eslintrc.json",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
	}
	for _, config_file in ipairs(eslint_config_files) do
		if vim.loop.fs_stat(root_dir .. "/" .. config_file) then
			return true
		end
	end
	return false
end
return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd.with({
					filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript", "css", "html" },
				}),
				null_ls.builtins.formatting.fixjson,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.fish,
				null_ls.builtins.diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc.json",
							".eslintrc.js",
							".eslintrc.yaml",
							".eslintrc.cjs",
							".eslintrc.yml",
						})
					end,
					diagnostics_format = "[eslint] #{m}\n(#{c})",
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_user_command("DisableLspFormatting", function()
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
		end, { nargs = 0 })
	end,
}
