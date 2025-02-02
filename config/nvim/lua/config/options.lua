-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local vim = vim
local opt = vim.opt

vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
