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
    config = function(_, opts)
      require('nvim-tree').setup(opts)

      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = 'NvimTree*',
        callback = function()
          local api = require('nvim-tree.api')
          local view = require('nvim-tree.view')

          if not view.is_visible() then
            api.tree.open()
          end
        end,
      })
    end,
	},
}
