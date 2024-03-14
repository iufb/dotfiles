function SetColor(color)
	color = color or "everforest"
	if color == "everforest" then
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_enable_bold = 1
		vim.g.everforest_cursor = "green"
		vim.g.everforest_transparent_background = 1
		vim.g.everforest_float_style = "dim"
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_better_performance = 1
	end

	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

SetColor("gruvbox")
