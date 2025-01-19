require("pqf").setup()
require("zen-mode").setup()

-------- Mini.nvim - https://github.com/echasnovski/mini.nvim
---- Text Editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require('mini.move').setup()

---- Workflow
require("mini.basics").setup()
require("mini.diff").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.sessions").setup({ autoread = true })

-- Appearance
require("mini.icons").setup()
require("mini.statusline").setup()

-- Others
require('mini.fuzzy').setup()

require('mini.hipatterns').setup()
local indentscope = require('mini.indentscope')
indentscope.setup({
  draw = { delay = 0, animation = indentscope.gen_animation.none() },
  symbol = '▏',
  options = { try_as_border = true }
})

-- indent-blankline
require("ibl").setup {
  scope = { show_start = false },
}

require("gruvbox").setup({
  terminal_colors = true,
  contrast = "hard",
  overrides = {
    StatusLine = { fg = "#1B1B1B", bg = "#1B1B1B" },
    StatusLineNC = { fg = "#1B1B1B", bg = "#1B1B1B" },
  },
  palette_overrides = {
    dark0_hard = "#1B1B1B",
  }
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
