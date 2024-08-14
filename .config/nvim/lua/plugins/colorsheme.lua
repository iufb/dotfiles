return {
	{ "sainnhe/everforest", lazy = false },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			disable_background = true,
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				disable_background = true,
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
}
