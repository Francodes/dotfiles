return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        contrast = "hard",
        overrides = {
          NormalFloat = { fg = "#EBDBB2", bg = "#1B1B1B" },
          StatusLine = { fg = "#1B1B1B", bg = "#1B1B1B" },
          StatusLineNC = { fg = "#1B1B1B", bg = "#1B1B1B" },
          MiniStatuslineInactive = { fg = "#8E8070", bg = "#1B1B1B" },
          MiniStatuslineFilename = { fg = "#EBDBB2", bg = "#1B1B1B" },
          MiniStatuslineDevinfo = { fg = "#8E8070", bg = "#1B1B1B" },
          MiniStatuslineFileinfo = { fg = "#8E8070", bg = "#1B1B1B" },
        },
        palette_overrides = {
          dark0_hard = "#1B1B1B",
        },
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    url = "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { show_start = false },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
    end,
    config = function()
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

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "nvim-tree toggle" })
      vim.keymap.set("n", "<leader>fe", ":NvimTreeFindFile<CR>", { silent = true, desc = "nvim-tree find file" })

      local augroup = vim.api.nvim_create_augroup("UserMiniNvim", {})
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "NvimTree",
        callback = function()
          vim.b.ministatusline_disable = true
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "NvimTree*",
        callback = function()
          local api = require("nvim-tree.api")
          local view = require("nvim-tree.view")

          if not view.is_visible() then
            api.tree.open()
          end
        end,
      })
    end,
  },
}
