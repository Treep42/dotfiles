""" MINIMUM VIMRC
set nocompatible
filetype plugin on
set number
set wildmenu
set encoding=utf8

""" VUNDLE
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" Vundle
"Plugin 'VundleVim/Vundle.vim'
"
" supertab
"Plugin 'ervandew/supertab'
"
"call vundle#end()

""" SYNTAX HIGHLIGHT
syntax on
set background=dark
colo elflord

""" INDENTATION
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
"set smartindent
set wrap

""" SEARCHING
"set ignorecase
set smartcase
set hlsearch

" show matching brackets and blink 2 tenths of a second
set showmatch
set mat=2

""" UTILITIES
" return to last edit position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif
" remember info about open buffers on close
set viminfo^=%

""" STATUSLINE
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

""" MOVEMENT
" treat long lines as break lines
map j gj
map k gk

" move smarter between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
