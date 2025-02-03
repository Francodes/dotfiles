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
			"zidhuss/neotest-minitest",
		},
		opts = {
			adapters = {
				["zidhuss/neotest-minitest"] = {},
			},
		},
	},
}
