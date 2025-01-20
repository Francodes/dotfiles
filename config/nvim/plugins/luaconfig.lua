require("pqf").setup()

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
require('mini.pick').setup()
vim.keymap.set('n', '<leader>ff', ":Pick files tool='git'<CR>", { desc = 'mini.pick files' })
vim.keymap.set('n', '<leader>fg', ":Pick grep_live tool='git'<CR>", { desc = 'mini.pick live grep' })
vim.keymap.set('n', '<leader>fb', ":Pick buffers tool='git'<CR>", { desc = 'mini.pick buffers' })
vim.keymap.set('n', '<leader>fh', ":Pick help tool='git'<CR>", { desc = 'mini.pick helptags' })
require('mini.extra').setup()

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


-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
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
})
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, desc = 'nvim-tree toggle' })
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { silent = true, desc = 'nvim-tree find file' })
