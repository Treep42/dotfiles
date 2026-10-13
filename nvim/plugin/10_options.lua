-- ------------------
--  SENSIBLE OPTIONS
-- ------------------

-- GENERAL ----------
vim.g.mapleader   = ' '            -- use <space> as <Leader> key

vim.o.mouse       = 'a'            -- enable mouse
vim.o.mousescroll = 'ver:25,hor:6' -- customize mouse scroll
vim.o.switchbuf   = 'usetab'       -- use already opened buffers when switching
vim.o.undofile    = true           -- enable persistend undo

-- ShaDa (Shared Data) files are used to presist a nvim session
-- create a sessionfile with:
-- 	:mksession vimbook.vim
-- restore session from within nvim:
-- 	:source vimbook.vim
-- start nvim with specific session:
--	vim -S vimbook.vim
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- limit ShaDa file for startup

-- UI ---------------
vim.o.breakindent    = true       -- indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1'  -- add padding for lists (if 'wrap' is set)
vim.o.colorcolumn    = '+1'       -- draw column on the right of maximum width
vim.o.cursorline     = true       -- enable current line highlighting
vim.o.linebreak      = true       -- wrap lines at 'breakat' (if 'wrap' is set)
vim.o.wrap           = true       -- visually wrap lines (toggle with \w)
vim.o.list           = true       -- show helpful text indicators
vim.o.number         = true       -- show line numbers
vim.o.relativenumber = true       -- use relative line numbers
vim.o.pumborder      = 'single'   -- use border in popup menu
vim.o.pumheight      = 10         -- make popup menu smaller
vim.o.pummaxwidth    = 100        -- make popup menu not too wide
vim.o.ruler          = false      -- don't show cursor coordinates
vim.o.shortmess      = 'CFOSWaco' -- disable some built-in completion messages
vim.o.showmode       = false      -- don't show mode in command line
vim.o.signcolumn     = 'yes'      -- always show signcolumn (less flicker)
vim.o.splitbelow     = true       -- horizontal splits will be below
vim.o.splitkeep      = 'screen'   -- reduce scroll during window split
vim.o.splitright     = true       -- vertical splits will be to the right
vim.o.winborder      = 'single'   -- use border in floating windows

vim.o.cursorlineopt  = 'screenline,number' -- Show cursor line per screen line

-- special UI symbols
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- see vim.o.list

-- folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel   = 10       -- fold nothing by default
vim.o.foldmethod  = 'indent' -- fold based on indent level
vim.o.foldnestmax = 10       -- limit number of fold levels
vim.o.foldtext    = ''       -- show text under fold with its highlighting

-- EDITING ----------
vim.o.autoindent    = true    -- use auto indent
vim.o.expandtab     = true    -- convert tabs to spaces
vim.o.formatoptions = 'crqnl1j'-- improve comment editing
vim.o.ignorecase    = true    -- ignore case during search...
vim.o.smartcase     = true    -- ... but respect it if search pattern has upper case
vim.o.incsearch     = true    -- show search matches while typing
vim.o.infercase     = true    -- infer case in built-in completion
vim.o.shiftwidth    = 4       -- use this number of spaces for indentation
vim.o.smartindent   = true    -- make indenting smart
vim.o.spelloptions  = 'camel' -- treat camelCase word parts as separate words
vim.o.tabstop       = 4       -- show tab as this number of spaces
vim.o.virtualedit   = 'block' -- allow going past end of line in blockwise mode

vim.o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete        = '.,w,b,kspell'                  -- Use less sources
vim.o.completeopt     = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior
vim.o.completetimeout = 100                             -- Limit sources delay

-- AUTOCOMMANDS -----

-- Don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function() vim.cmd('setlocal formatoptions-=o') end
Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- DIAGNOSTICS ------

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
local diagnostic_opts = {
  -- Show signs on top of any other sign, but only for warnings and errors
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  -- Show more details immediately for errors on the current line
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },

  -- Don't update diagnostics when typing
  update_in_insert = false,
}

-- Use `later()` to avoid sourcing `vim.diagnostic` on startup
Config.later(function() vim.diagnostic.config(diagnostic_opts) end)

