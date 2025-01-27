return {
	{
		"nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "echasnovski/mini.icons",
    },
		opts = {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		},
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "NvimTree Toggle", silent = true },
      { "<leader>fe", ":NvimTreeFindFile<CR>", desc = "Find File in NvimTree", silent = true },
    },
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
	},
}
