return {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      indent = { enabled = true, animate = { enabled = false } },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      zen = { enabled = true },
    },
    keys = {
      -- Lazygit
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
      -- Zen
      { "<leader>uz", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>uZ", function() Snacks.zen.zoom() end, desc = "Toggle Zoom Mode" },
      -- Git
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      -- Gitbrowse
      { "<leader>gB", function() Snacks.gitbrowse.open() end, desc = "Git Browse (open)" },
    },
  },
}
