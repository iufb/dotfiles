return {
	{ "sainnhe/everforest", lazy = false },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			dark_variant = "moon",

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
}
