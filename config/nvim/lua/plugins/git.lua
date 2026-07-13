return {
  {
    "tpope/vim-fugitive",
    init = function()
      vim.g.fugitive_pty = 0
    end,
  },
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
