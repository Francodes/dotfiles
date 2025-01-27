return {
  {
    "vim-test/vim-test",
    opts = {},
    keys = {
      { "<leader>;", ":TestNearest --quiet --defer-output<CR> ", { noremap = true, silent = true, desc = "Test Nearest" } },
      { "<leader>'", ":TestFile --quiet --defer-output<CR> ", { noremap = true, silent = true, desc = "Test File" } },
      { "<leader>;;", ":TestNearest --quiet --defer-output CI=false<CR> ", { noremap = true, silent = true, desc = "Test Nearest Headfull" } },
      { "<leader>;;", ":TestFile --quiet --defer-output CI=false<CR> ", { noremap = true, silent = true, desc = "Test File Headfull" } },
    },
  },
}
