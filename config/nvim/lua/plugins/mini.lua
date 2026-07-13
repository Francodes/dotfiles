return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.comment").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
      })
      require("mini.splitjoin").setup()
      require("mini.surround").setup()

      require("mini.basics").setup()
      require("mini.diff").setup()
      require("mini.files").setup()
      require("mini.jump").setup()
      require("mini.sessions").setup({ autoread = true })
      require("mini.bracketed").setup()

      require("mini.pick").setup()
      vim.keymap.set("n", "<leader>l", ":Pick buffers tool='git'<CR>", { desc = "mini.pick buffers" })
      vim.keymap.set("n", "<leader>ff", ":Pick files tool='git'<CR>", { desc = "mini.pick files" })
      vim.keymap.set("n", "<leader>fg", ":Pick grep_live tool='git'<CR>", { desc = "mini.pick live grep" })
      vim.keymap.set("n", "<leader>fb", ":Pick buffers tool='git'<CR>", { desc = "mini.pick buffers" })
      vim.keymap.set("n", "<leader>fo", ":Pick oldfiles preserve_order=true<CR>", { desc = "mini.pick oldfiles" })
      vim.keymap.set("n", "<leader>fh", ":Pick hl_groups<CR>", { desc = "mini.pick highlight groups" })
      vim.keymap.set("n", "<leader>fd", ":Pick diagnostic<CR>", { desc = "mini.pick diagnostics" })
      vim.keymap.set("n", "<leader>fr", ":Pick resume<CR>", { desc = "mini.pick resume latest picker" })

      require("mini.extra").setup()

      require("mini.icons").setup()
      require("mini.statusline").setup()

      require("mini.fuzzy").setup()

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      local indentscope = require("mini.indentscope")
      indentscope.setup({
        draw = { delay = 0, animation = indentscope.gen_animation.none() },
        symbol = "▏",
        options = { try_as_border = true },
      })
    end,
  },
}
