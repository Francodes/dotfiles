" Auto install Vim Plugs
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'vim-test/vim-test'            " Run tests for multiple formats
Plug 'tpope/vim-rails'              " Rails plugin
Plug 'airblade/vim-localorie'       " Rails localization
Plug 'adelarsq/vim-matchit'         " Match most tags using %

Plug 'tpope/vim-dispatch'           " Runs helper tasks async

Plug 'tpope/vim-fugitive'           " :Gblame
Plug 'tpope/vim-rhubarb'            " :GBrowse

Plug 'ellisonleao/gruvbox.nvim'     " Provides the 'gruvbox' color scheme
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git' " Adds better looking quickfix window

" Mini Utils
Plug 'echasnovski/mini.nvim'        " Adds mini utilities, enabled in luaconfig.lua
Plug 'nvim-tree/nvim-tree.lua'      " Provides file explorer support
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide lines
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kdheepak/lazygit.nvim'        " Provides lazygit support in vim
Plug 'zbirenbaum/copilot.lua'

" HTML helpers
Plug 'AndrewRadev/tagalong.vim'     " HTML tag rename open/close
Plug 'tpope/vim-ragtag'             " HTML conviniences

" Set up fzf and fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP Related Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" LSP Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'folke/lsp-colors.nvim'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

" Adds icon support to multiple plugins
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()
