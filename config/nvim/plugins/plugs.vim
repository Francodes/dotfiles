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
Plug 'adelarsq/vim-matchit'         " Match most tags using %
Plug 'folke/zen-mode.nvim'          " Zenmode editing of files

Plug 'tpope/vim-endwise'            " Autocomplete end after a do
Plug 'tpope/vim-speeddating'        " Enhances Vim increment/decrement
Plug 'tpope/vim-dispatch'           " Runs helper tasks async
Plug 'tpope/vim-repeat'             " Repeat (.) support for plugin tasks

Plug 'tpope/vim-fugitive'           " :Gblame
Plug 'tpope/vim-rhubarb'            " :GBrowse
Plug 'tpope/vim-surround'           " Helps inside (), '', {}, etc
Plug 'tpope/vim-commentary'         " gc/gcc - Commenting functions
Plug 'brooth/far.vim'               " Adds :Far command to do Find and Replace

Plug 'airblade/vim-gitgutter'       " Show git diff of lines edited
Plug 'morhetz/gruvbox'              " Provides the 'gruvbox' color scheme

Plug 'vim-airline/vim-airline'      " Vim powerline
Plug 'kdheepak/lazygit.nvim'        " Provides lazygit support in vim
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git' " Adds better looking quickfix window

" HTML helpers
Plug 'AndrewRadev/tagalong.vim'     " HTML tag rename open/close
Plug 'mattn/emmet-vim'              " Allow for emmet commands in HTML
Plug 'tpope/vim-ragtag'             " HTML conviniences

" NerdTree
Plug 'scrooloose/nerdtree'          " File explorer support
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git marks on file explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Better file highlighting

" Set up fzf and fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide lines

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
Plug 'github/copilot.vim'
Plug 'folke/lsp-colors.nvim'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

" Adds icon support to multiple plugins
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()
