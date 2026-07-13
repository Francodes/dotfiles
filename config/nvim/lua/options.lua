vim.opt.colorcolumn = "80"
vim.opt.winborder = "rounded"
vim.cmd("highlight! link SignColumn LineNr")

vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list"
vim.opt.lazyredraw = true
vim.opt.updatetime = 300
vim.opt.list = true
vim.opt.listchars = { tab = "␉·", trail = "␠", nbsp = "⎵" }
vim.opt.undofile = true
vim.opt.title = false
vim.opt.confirm = true
vim.opt.autoread = true
vim.opt.showmatch = true
vim.opt.laststatus = 2

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.signcolumn = "no"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.ruler = true

vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.smartindent = true

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

vim.opt.errorbells = false
vim.opt.visualbell = true
vim.cmd("set t_vb=")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamed,unnamedplus"
