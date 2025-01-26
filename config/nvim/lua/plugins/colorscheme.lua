return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		name = "gruvbox",
		priority = 1000,
		opts = {
			terminal_colors = true,
			contrast = "hard",
			overrides = {
				StatusLine = { fg = "#1B1B1B", bg = "#1B1B1B" },
				StatusLineNC = { fg = "#1B1B1B", bg = "#1B1B1B" },
				MiniStatuslineInactive = { fg = "#8E8070", bg = "#1B1B1B" },
				MiniStatuslineFilename = { fg = "#EBDBB2", bg = "#1B1B1B" },
				MiniStatuslineDevinfo = { fg = "#8E8070", bg = "#1B1B1B" },
				MiniStatuslineFileinfo = { fg = "#8E8070", bg = "#1B1B1B" },
			},
			palette_overrides = {
				dark0_hard = "#1B1B1B",
			},
		},
    init = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
	},
}
