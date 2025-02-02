return {
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"suketa/nvim-dap-ruby",
			opts = {},
		},
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"olimorris/neotest-minitest",
		},
		opts = {
			adapters = {
				["olimorris/neotest-minitest"] = {},
			},
		},
	},
}
