return {
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"suketa/nvim-dap-ruby",
			opts = {},
		},
	},
	{ "nvim-neotest/neotest-plenary" },
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"zidhuss/neotest-minitest",
		},
		opts = {
			adapters = {
				["neotest-plenary"] = {},
				["neotest-minitest"] = {
					test_cmd = function()
						return vim.iter({
							"bundle",
							"exec",
							"rails",
							"test",
						})
							:flatten()
							:totable()
					end,
				},
			},
		},
	},
}
