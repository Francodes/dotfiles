return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "ruby",
          "embedded_template",
          "javascript",
          "typescript",
          "lua",
          "vim",
          "vimdoc",
          "yaml",
          "json",
          "html",
          "css",
          "scss",
          "markdown",
          "bash",
          "sql",
        },
        highlight = { enable = true },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "eruby" },
    opts = {},
  },
  {
    "axkirillov/hbac.nvim",
    opts = {},
  },
  {
    "tpope/vim-ragtag",
  },
  {
    "paulbkim-dev/vim-herdr-navigation",
    lazy = false,
    config = function()
      dofile(vim.fn.stdpath("data") .. "/lazy/vim-herdr-navigation/editor/nvim.lua")
    end,
  },
}
