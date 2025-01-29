return {
  { "tpope/vim-rails" },
  { "AndrewRadev/tagalong.vim" },
  { 
    "tpope/vim-dispatch",
    init = function()
      vim.cmd("let test#strategy = 'dispatch'")
    end,
  },
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>;", ":TestNearest --quiet --defer-output<CR> ", { noremap = true, silent = true, desc = "Test Nearest" } },
      { "<leader>'", ":TestFile --quiet --defer-output<CR> ", { noremap = true, silent = true, desc = "Test File" } },
      { "<leader>;;", ":TestNearest --quiet --defer-output CI=false<CR> ", { noremap = true, silent = true, desc = "Test Nearest Headfull" } },
      { "<leader>;;", ":TestFile --quiet --defer-output CI=false<CR> ", { noremap = true, silent = true, desc = "Test File Headfull" } },
    },
  },
  { 
    "airblade/vim-localorie",
    keys = {
      { "<leader>ft", ":call localorie#translate()<CR>", { noremap = true, silent = true, desc = "Find Translation" } },
    },
  },
}
