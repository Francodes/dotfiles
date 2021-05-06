set nocompatible " be iMproved, required
filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'vim-test/vim-test'            " Run tests for multiple formats
Plug 'tpope/vim-rails'              " Rails plugin

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
Plug 'styled-components/vim-styled-components'

Plug 'vim-airline/vim-airline'      " Vim powerline

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'             " Set up fzf and fzf.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

" Leader key is SPACE, I find it the best
let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
colorscheme gruvbox
set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

" Treat long lines as break lines
map j gj
map k gk

" Indentation
set autoindent
set cindent
set smartindent

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Ack tricks
let g:ackprg = 'ag --vimgrep'
nmap <leader>a :Ack! ""<Left>
nmap <leader>A :Ack! "\b<cword>\b"<CR>

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" +++ Shortcuts +++
" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Open test file for a current file
nnoremap <silent><leader>s :A<CR>
" Open test file for a current file in a vertical window
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>/ :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
"
" Go to file on new plit
map <leader>gf <c-w>vgf

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag <Cr>

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
" vim-test shortcut for running tests
nnoremap <silent><leader>; :TestNearest<CR>
nnoremap <silent><leader>' :TestFile<CR>

" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Format
nmap <leader>f   :CocCommand prettier.formatFile<CR>

" Fix some weird error with Fugitive
let g:fugitive_pty = 0

" Change cursor to solid vertical line
" There are problems with Vim's floating window setting cursor to a solid
" block. So these lines below are resetting it to a solid vertical line.
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[6 q"
augroup END

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=Magenta guibg=Magenta

" NERDTree tricks
map <C-n> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
