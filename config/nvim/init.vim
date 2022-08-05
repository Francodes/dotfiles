set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.config/nvim/plugins/plugs.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/config.vim
