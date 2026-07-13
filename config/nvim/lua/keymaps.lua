vim.keymap.set({ "n", "x", "o" }, "j", "gj")
vim.keymap.set({ "n", "x", "o" }, "k", "gk")

vim.keymap.set("n", "z", "za")

vim.keymap.set("n", "<leader>w", ":w!<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<leader>1", ":e $MYVIMRC<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", ":source $MYVIMRC<CR>", { silent = true })

vim.keymap.set("n", "<leader>gf", "<C-w>vgf")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "g_")

vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%")<CR>', { silent = true })

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = { "*.md", "*.md.erb", "*.feature" },
  command = "setlocal spell",
})
