return {
  -- Text Editing
  { "echasnovski/mini.ai", opts = {} },
  { "echasnovski/mini.comment", opts = {} },
  { "echasnovski/mini.extra", opts = {} },
  { "echasnovski/mini.splitjoin", opts = {} },
  { "echasnovski/mini.surround", opts = {} },
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  -- Workflow
  {
    "echasnovski/mini.basics",
    opts = {
      options = { extra_ui = true },
      mappings = { windows = true }
    },
  },
  { "echasnovski/mini.bracketed", opts = {} },
  { "echasnovski/mini.diff", opts = { view = { style = "number" } } },
  { "echasnovski/mini.jump", opts = {} },
  { "echasnovski/mini.sessions", opts = { autoread = true } },
  {
    "echasnovski/mini.pick",
    opts = {},
    keys = {
      { "<leader>ff", function() MiniPick.builtin.files({ tool = "git" }) end, desc = "Find Git Files" },
      { "<leader>fg", function() MiniPick.builtin.grep_live({ tool = "git" }) end, desc = "Live Grep" },
      { "<leader>fb", function() MiniPick.builtin.buffers({ tool = "git" }) end, desc = "Buffers" },
      { "<leader>fr", function() MiniExtra.pickers.oldfiles({ preserve_order = true }) end, desc = "Find Recent" },
      { "<leader>fh", function() MiniExtra.pickers.hl_groups() end, desc = "Find Highlight Groups" },
      { "<leader>fd", function() MiniExtra.pickers.diagnostic() end, desc = "Find Diagnostics" },
    },
  },
  -- Appearance
  { "echasnovski/mini.hipatterns", opts = {} },
  {
    "echasnovski/mini.statusline", 
    opts = {},
    init = function()
      -- Disable mini.statusline in NvimTree
      local augroup = vim.api.nvim_create_augroup("UserMiniNvim", {})
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "NvimTree",
        callback = function(ev)
          vim.b.ministatusline_disable = true
        end,
      })
    end,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      indent = { enabled = true, animate = { enabled = false } },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      gitbrowse = { enabled = true },
      zen = { enabled = true },
    },
    keys = {
      -- Lazygit
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
      -- Zen
      { "<leader>uz", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>uZ", function() Snacks.zen.zoom() end, desc = "Toggle Zoom Mode" },
      -- Gitbrowse
      { "<leader>gB", function() Snacks.gitbrowse.open() end, desc = "Git Browse (open)" },
    },
  },
}

