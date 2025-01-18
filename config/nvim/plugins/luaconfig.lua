require("pqf").setup()
require("zen-mode").setup()

-------- Mini.nvim - https://github.com/echasnovski/mini.nvim
---- Text Editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()

---- Workflow
require("mini.basics").setup()
require("mini.diff").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.sessions").setup({ autoread = true })

-- Appearance
require("mini.statusline").setup()
require("mini.icons").setup()

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
