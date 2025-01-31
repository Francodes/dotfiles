require("pqf").setup()

-- indent-blankline
require("ibl").setup {
  scope = { show_start = false },
}

require("gruvbox").setup({
  terminal_colors = true,
  contrast = "hard",
  overrides = {
    NormalFloat = { fg = "#EBDBB2", bg = "#1B1B1B" },
    StatusLine = { fg = "#1B1B1B", bg = "#1B1B1B" },
    StatusLineNC = { fg = "#1B1B1B", bg = "#1B1B1B" },
    MiniStatuslineInactive = { fg = "#8E8070", bg = "#1B1B1B"  },
    MiniStatuslineFilename = { fg = "#EBDBB2", bg = "#1B1B1B" },
    MiniStatuslineDevinfo = { fg = "#8E8070", bg = "#1B1B1B" },
    MiniStatuslineFileinfo = { fg = "#8E8070", bg = "#1B1B1B" },
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
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  skip_ts = { "string" },
  skip_unbalanced = true,
  markdown = true,
})
require("mini.splitjoin").setup()
require("mini.surround").setup()

---- Workflow
require("mini.basics").setup()
require("mini.diff").setup()
require("mini.files").setup()
require("mini.jump").setup()
require("mini.sessions").setup({ autoread = true })
require('mini.bracketed').setup()
require('mini.pick').setup()
vim.keymap.set('n', '<leader>ff', ":Pick files tool='git'<CR>", { desc = 'mini.pick files' })
vim.keymap.set('n', '<leader>fg', ":Pick grep_live tool='git'<CR>", { desc = 'mini.pick live grep' })
vim.keymap.set('n', '<leader>fb', ":Pick buffers tool='git'<CR>", { desc = 'mini.pick buffers' })
vim.keymap.set('n', '<leader>fr', ":Pick oldfiles preserve_order=true<CR>", { desc = 'mini.pick oldfiles' })
vim.keymap.set('n', '<leader>fh', ":Pick hl_groups<CR>", { desc = 'mini.pick highlight groups' })
vim.keymap.set('n', '<leader>fd', ":Pick diagnostic<CR>", { desc = 'mini.pick diagnostics' })
require('mini.extra').setup()

-- Appearance
require("mini.icons").setup()
require("mini.statusline").setup()

-- Others
require('mini.fuzzy').setup()
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
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
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = 'nvim-tree toggle' })
vim.keymap.set('n', '<leader>fe', ':NvimTreeFindFile<CR>', { silent = true, desc = 'nvim-tree find file' })
-- Disable mini.statusline in NvimTree
local augroup = vim.api.nvim_create_augroup("UserMiniNvim", {})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "NvimTree",
  callback = function(ev)
    vim.b.ministatusline_disable = true
  end,
})
-- Restore NvimTree through sessions
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

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-j>",
      accept_word = "<C-l>",
       next = "<C-k>",
       dismiss = "<C-h>",
    },
  },
  copilot_node_command = "/Users/franco/.asdf/installs/nodejs/18.19.0/bin/node",
})
