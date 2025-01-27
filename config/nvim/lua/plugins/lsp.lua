return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp"
    },
    keys = {
      { "K", vim.lsp.buf.hover, mode = "n", desc = "Show hover information" },
      { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
      { "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", mode = "n", desc = "Go to definition" },
      { "gr", vim.lsp.buf.references, mode = "n", desc = "Show references" },
      { "<leader>ca", vim.lsp.buf.code_action, mode = "n", desc = "Code action" },
      { "<leader>cR", vim.lsp.buf.rename, mode = "n", desc = "Rename" },
    },
    init = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities
      })
    end,
  },
}
