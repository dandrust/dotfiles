set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8

" Vundle Packages
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Townk/vim-autoclose'
" Theme
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'sjl/tslime.vim'

Plugin 'tpope/vim-rails'

call vundle#end()

" Leader Shortcuts
let mapleader = "\<Space>" 
" shortcut for escapting INSERT mode
inoremap kj <Esc>
inoremap jk <Esc>

" Colors
syntax enable
set background=dark
let g:airline_theme='base16_solarized'
colorscheme solarized

" Spaces and Tabs
set tabstop=2		" number of visual spacer per tab
set softtabstop=2	" number of spaces in tab
set expandtab		" tabs are spaces
set backspace=indent,eol,start	" sane backspace behavior

" UI Config
filetype plugin indent on    " load filetype-specific indent and plugin files
set textwidth=80          " show vertical bar at 80 chars
set colorcolumn=+1        " show vertical bar at 80 chars
set numberwidth=5         " number gutter is 5 chars wide
set number relativenumber	" use relative line numbers
set lazyredraw		" only redraw the screen when necessary (faster macros)
let g:airline_powerline_fonts = 1
set splitbelow
set splitright

" Searching
set incsearch		" search throughout term input
set hlsearch		" highlight results in buffer
nnoremap <Leader>l :nohlsearch<CR>
nnoremap <C-p> :Files<CR>
nnoremap \ :Ag<Space>

" Folding
set foldenable 		" enable folding
set foldlevelstart=10	" show most folds by default
set foldnestmax=10	" 10 nested fold nax
set foldmethod=indent	" fold based on indent level

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" easily move to beginning of line
nnoremap 0 ^
" highlight last inserted text
nnoremap gV `[v`]

" NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

" Tagbar Settings
map <C-t> :TagbarToggle<CR>

" Tslime Settings
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<localleader>T'
let g:tslime_ensure_trailing_newlines = 1
