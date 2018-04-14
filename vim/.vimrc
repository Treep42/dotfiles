" ~/.vimrc (configuration file for vim only)

set nocompatible
"filetype off

"
" Vundle Plugins
"

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
" get Vundle itself
"Plugin 'VundleVim/Vundle.vim'
"
" supertab
"Plugin 'ervandew/supertab'
"
"call vundle#end()

"
" General
"

"filetype plugin indent on
filetype plugin on

set number "show line numbers

" set a map leader to create new key combinations
let mapleader = ","
let g:mapleader = ","

set wildmenu

"
" Colors, Fonts and Searching
"

" set background=dark
" let g:rehash256 = 1
" colo molokai
colo elflord
""colo 256-gray "color scheme
syntax on "syntax highlighting
set encoding=utf8 "encoding

" set tabstop to 4 spaces
set tabstop=4
set shiftwidth=4
" set expandtab "expand tabs to spaces
"set ai "auto indent
"set si "smart indent
set wrap "wrap lines

" searching:
set ignorecase "ignore case
set smartcase "search smart case
"set hlsearch "highlight search results

" show matching brackets and blink 2 tenths of a second
set showmatch
set mat=2


"
" Nice Stuff
"

" return to last edit position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif
" remember info about open buffers on close
set viminfo^=%

" always show status line
set laststatus=2
" format status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"
" Movement
"

" treat long lines as break lines
map j gj
map k gk

" useful mappings for tabs
map <leader>tn :tabnew
map <leader>tm :tabmove
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" move smarter between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" helper functions

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction


function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	let login = system('whoami')
	if v:shell_error
	   let login = 'unknown'
	else
	   let newline = stridx(login, "\n")
	   if newline != -1
		let login = strpart(login, 0, newline)
	   endif
	endif
	let hostname = system('hostname -f')
	if v:shell_error
	    let hostname = 'localhost'
	else
	    let newline = stridx(hostname, "\n")
	    if newline != -1
		let hostname = strpart(hostname, 0, newline)
	    endif
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" ~/.vimrc ends here
