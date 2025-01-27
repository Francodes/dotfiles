return {
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
