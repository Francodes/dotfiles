return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>do",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>d[",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>d]",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        { noremap = true, silent = true }
      )

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = false,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts)
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "x" }, "<F4>", vim.lsp.buf.code_action, opts)
          vim.keymap.set({ "n", "x" }, "<leader>f", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
          end, opts)
        end,
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({ "lua_ls", "ruby_lsp", "herb_ls", "eslint", "stylelint_lsp" })
    end,
  },
}
