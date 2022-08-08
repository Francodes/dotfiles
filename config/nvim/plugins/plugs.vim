" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'vim-test/vim-test'            " Run tests for multiple formats
Plug 'tpope/vim-rails'              " Rails plugin
Plug 'adelarsq/vim-matchit'         " Match most tags using %

Plug 'tpope/vim-endwise'            " Autocomplete end after a do
Plug 'tpope/vim-sleuth'             " Auto-detect indentation format
Plug 'tpope/vim-speeddating'        " Enhances Vim increment/decrement
Plug 'tpope/vim-dispatch'           " Runs helper tasks async
Plug 'tpope/vim-repeat'             " Repeat (.) support for plugin tasks

Plug 'tpope/vim-fugitive'           " :Gblame
Plug 'tpope/vim-rhubarb'            " :GBrowse
Plug 'tpope/vim-surround'           " Helps inside (), '', {}, etc
Plug 'tpope/vim-commentary'         " gc/gcc - Commenting functions

Plug 'airblade/vim-gitgutter'       " Show git diff of lines edited
Plug 'mileszs/ack.vim'              " Use ack in Vim
Plug 'scrooloose/nerdtree'          " File explorer support
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git marks on file explorer
Plug 'morhetz/gruvbox'              " Provides the 'gruvbox' color scheme

Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'leafgarland/typescript-vim'   " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'     " JS and JSX syntax
Plug 'jparise/vim-graphql'          " GraphQL syntax

Plug 'vim-airline/vim-airline'      " Vim powerline

" Set up fzf and fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shopify/shadowenv.vim'

" Testing these
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'

" All of your Plugins must be added before the following line
call plug#end()
