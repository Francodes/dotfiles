return {
  {
    "vim-test/vim-test",
    init = function()
      vim.g["test#strategy"] = "dispatch"
    end,
    keys = {
      { "<leader>;", ":TestNearest --quiet --defer-output<CR>", silent = true },
      { "<leader>'", ":TestFile --quiet --defer-output<CR>", silent = true },
      { "<leader>;;", ":TestNearest --quiet --defer-output CI=false<CR>", silent = true },
      { "<leader>''", ":TestFile CI=false --quiet --defer-output<CR>", silent = true },
    },
  },
  {
    "tpope/vim-dispatch",
    keys = {
      { "<leader>r", ":Dispatch bundle exec rubocop %<CR>" },
      { "<leader>ra", ":Dispatch! bundle exec rubocop -a %<CR>" },
    },
  },
  {
    "tpope/vim-rails",
    keys = {
      { "<leader>v", ":AV<CR>", silent = true },
    },
  },
  {
    "airblade/vim-localorie",
    keys = {
      { "<leader>lt", ":call localorie#translate()<CR>", silent = true },
      { "<leader>le", ":echo localorie#expand_key()<CR>", silent = true },
    },
  },
}
