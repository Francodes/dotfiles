set nocompatible " be iMproved, required
filetype off     " required
filetype plugin indent on    " required

" Leader key is SPACE
let mapleader = " "

" Look and feel
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
set t_Co=256
highlight! link SignColumn LineNr
highlight! link WinSeparator GruvboxFg
highlight link GitGutterAdd GruvboxGreen
highlight link GitGutterChange GruvboxAqua
highlight link GitGutterDelete GruvboxRed
highlight link GitGutterChangeDelete GruvboxAqua
set colorcolumn=80

" Settings
syntax enable
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set wildmode=longest,list   " get bash-like tab completions
set lazyredraw
set updatetime=300
set list
set listchars=tab:␉·,trail:␠,nbsp:⎵
set undofile
set notitle
set confirm
set autoread
set showmatch
set laststatus=3

" Completion
set completeopt=menu,menuone,noselect

" Numbers
set number
set numberwidth=4
set ruler

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

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=UTF-8
set termencoding=UTF-8

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

" Scrolling
set scrolloff=8
set sidescrolloff=8

" Allow copy and paste from system clipboard
set clipboard^=unnamed,unnamedplus

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" +++ Shortcuts +++
" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Open test file for a current file in a vertical window
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>v :vs<CR>
" Split screen
nnoremap <silent><leader>h :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
" Open/Source Vim configuration file
nnoremap <silent><leader>1 :e $MYVIMRC<CR>
nnoremap <silent><leader>2 :source $MYVIMRC<CR>

" Go to file on new plit
map <leader>gf <c-w>vgf

" Toggle relative line numbers
nnoremap <leader>rl :set relativenumber!<cr>

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles --cached --others --exclude-standard<Cr>
" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag <Cr>

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" vim-test shortcut for running tests
nnoremap <silent><leader>; :TestNearest --quiet --defer-output<CR>
nnoremap <silent><leader>' :TestFile --quiet --defer-output<CR>
nnoremap <silent><leader>;; :TestNearest --quiet --defer-output CI=false<CR>
nnoremap <silent><leader>'' :TestFile CI=false --quiet --defer-output<CR>

" Run Rubocop
nmap <Leader>r :Dispatch bundle exec rubocop %<CR>
nmap <leader>ra :Dispatch! bundle exec rubocop -a %<CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Map H/L to move to the beginning/end of a line
nnoremap H ^
nnoremap L g_

" Copy current filename to clipboard
nnoremap <silent> <leader>cp :let @+ = expand("%")<CR>

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

" NERDTree
let NERDTreeNaturalSort = 1
map <C-n> :silent! NERDTreeToggle<CR>
map <leader>nf :silent! NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" lazy-git.vim
nnoremap <silent><leader>gg :LazyGit<CR>

" Zenmode
nnoremap <silent><leader>z :ZenMode<CR>

" Tagalong
let g:tagalong_verbose = 1

" Emmet
let g:user_emmet_leader_key = ','

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Lua specific configurations
lua << EOF
  require('pqf').setup()
  require("zen-mode").setup()

  -- indent-blankline
  require("ibl").setup {
    scope = { show_start = false },
  }
EOF
