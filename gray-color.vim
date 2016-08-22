" Vim color file
" Modification of vim color theme 256-gray by Piotr Husiatyński <phusiatynski@gmail.com>

hi clear
set background=dark
set t_Co=256
let g:colors_name="256-gray"

let python_highlight_all = 1
let c_gnu = 1

" these are our colors:
" darkGreen=28
" green=112

" darkBlue=26
" mediumBlue=75
" lightBlue=81

" darkPurple=54
" purple=141
" lightPurple=147

" lightRed=175
" red=197

" darkOrange=166
" orange=208

" darkYellow=178
" yellow=221

" white=252
" lightGray1=247
" lightGray2=243
" mediumGray1=238
" mediumgray2=236
" darkGray=234
" black=232

hi Normal	    ctermfg=252	ctermbg=234		cterm=None
hi Cursor       ctermfg=197	ctermbg=None	cterm=None
hi SpecialKey	ctermfg=81	ctermbg=None	cterm=Bold
hi Directory	ctermfg=112	ctermbg=None	cterm=None
hi ErrorMsg     ctermfg=197	ctermbg=252		cterm=None

"hi PreProc	    ctermfg=247 ctermbg=None	cterm=Bold
hi PreProc	    ctermfg=141	ctermbg=None	cterm=Bold
hi Include		ctermfg=197 ctermbg=None	cterm=None
hi Macro		ctermfg=175	ctermbg=None	cterm=None
hi def link Define		Include	
"hi def link Macro		Preproc
hi def link PreCondit	Preproc

hi Search	    ctermfg=197	ctermbg=232		cterm=Bold

hi Type		    ctermfg=26	ctermbg=None	cterm=Bold
hi def link StorageClass	Type
hi def link Structure	Type
hi def link	Typedef		Type

hi Statement	ctermfg=208	ctermbg=None	cterm=None
hi def link Conditional	Statement
hi def link Repeat		Statement
hi def link Label		Statement
hi def link Operator	Statement
hi def link Keyword		Statement
hi def link Exception	Statement

hi Comment	    ctermfg=243	ctermbg=None	cterm=None

hi Identifier	ctermfg=75	ctermbg=None	cterm=Bold
hi Function		ctermfg=197	ctermbg=None	cterm=None
"hi def link Function	Identifier

hi DiffText		ctermfg=197	ctermbg=252		cterm=None

hi Constant	    ctermfg=221	ctermbg=None	cterm=None
hi def link Number		Constant
hi def link Boolean		Constant
hi def link String		Constant
hi def link Character	Constant
hi def link Float		Constant

hi Todo         ctermfg=232	ctermbg=112		cterm=Bold
hi Error	    ctermfg=232	ctermbg=197		cterm=Bold

hi Special	    ctermfg=197	ctermbg=None	cterm=Bold
hi def link SpecialChar	Special
hi def link Tag			Special
hi def link Delimiter	Special
hi def link SpecialComment	Special
hi def link Debug		Special

hi Ignore       ctermfg=221	ctermbg=None	cterm=Bold

"TODO change underline color
hi Underline    ctermfg=81	ctermbg=None	cterm=underline
hi def link Underlined	Underline

hi FoldColumn	ctermfg=247         ctermbg=None       cterm=Bold
hi StatusLineNC ctermfg=247         ctermbg=232        cterm=None
hi StatusLine   ctermfg=247         ctermbg=232        cterm=Bold
hi VertSplit    ctermfg=247         ctermbg=234        cterm=Bold

hi LineNr	    ctermfg=247         ctermbg=236        cterm=Bold
hi NonText	    ctermfg=81          ctermbg=None       cterm=Bold

hi Pmenu        ctermfg=247			ctermbg=234		cterm=None
hi PmenuSel     ctermfg=None		ctermbg=238		cterm=Bold
hi PmenuSbar    ctermfg=232			ctermbg=232		cterm=None
hi PmenuThumb   ctermfg=238			ctermbg=238		cterm=None

"vim: sw=4
