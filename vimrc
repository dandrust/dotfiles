set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Packages
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Theme
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

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
set number		" show line numbers
set number relativenumber	" use relative line numbers
filetype plugin indent on    " load filetype-specific indent and plugin files
set lazyredraw		" only redraw the screen when necessary (faster macros)

" Searching
set incsearch		" search throughout term input
set hlsearch		" highlight results in buffer
" user Ctrl-l to clear search highlighting
nnoremap <C-l> :nohlsearch<CR>

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

" Leader Shortcuts
let mapleader = "\<Space>" 
" shortcut for escapting INSERT mode
inoremap kj <Esc>
inoremap jk <Esc>
" open ag
nnoremap <leader>a :Ag<Space>

" Ctrl-P Settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" WHAT ABOUT incorporating this stuff into updated vimrc?
"  set rtp+=/usr/local/opt/fzf
"  function! s:find_git_root()
"    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
"  endfunction
"  command! ProjectFiles execute 'Files' s:find_git_root()
"  nnoremap <c-P> :ProjectFiles<CR>
"  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

