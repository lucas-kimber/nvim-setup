return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "Kanagawa Lotus",
						colorscheme = "kanagawa-lotus",
					},
					{
						name = "Kanagawa Dragon",
						colorscheme = "kanagawa-dragon",
					},
					{
						name = "Kanagawa Wave",
						colorscheme = "kanagawa-wave",
					},
					{
						name = "Rose Pine",
						colorscheme = "rose-pine",
					},
					{
						name = "Cattpuccin Latte",
						colorscheme = "catppuccin-latte",
					},
					{
						name = "Catppuccin Macchiato",
						colorscheme = "catppuccin-macchiato",
					},
					{
						name = "Catppuccin Frappe",
						colorscheme = "catppuccin-frappe",
					},
					{
						name = "Catppuccin Mocha",
						colorscheme = "catppuccin-mocha",
					},
				},
				livePreview = true,
				vim.keymap.set("n", "<leader>tt", ":Themery", {}),
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
}
