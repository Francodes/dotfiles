return {
  {
    "echasnovski/mini.statusline", 
    config = function()
      -- Disable mini.statusline in NvimTree
      local augroup = vim.api.nvim_create_augroup("UserMiniNvim", {})
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "NvimTree",
        callback = function(ev)
          vim.b.ministatusline_disable = true
        end,
      })

      require("mini.statusline").setup {}
    end,
  },
}
