local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.setup_nvim_cmp({
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }
})

lsp.nvim_workspace()

lsp.setup()
