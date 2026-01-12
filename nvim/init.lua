vim.opt.number = true
vim.opt.wildmenu = true

-- remap the "jump to tag" to a more DE-keyboard friendly key
vim.keymap.set('n', '<C-ö>', '<C-]>', { remap = true })

-- set tabs to appear 4 spaces wide
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

-- lazy.nvim plugin manager
require("config.lazy")

-- mini plugins
require("mini.align").setup() -- align text (command: ga/gA)
require("mini.comment").setup() -- comment text (gc / gcc (line))
require("mini.move").setup() -- move selected text (move selection with Alt+hjkl)
require("mini.pairs").setup() -- automatic pairing of common delimiters (){}[]"" etc.
require("mini.splitjoin").setup() -- splitting/joining of arguments/lists/etc. (gS = toggle split)
require("mini.surround").setup() -- add/delete/replace/find/highlight surrounding
require("mini.icons").setup()
require("mini.basics").setup()
require("mini.git").setup() -- tracking of git status, :Git command to execute git calls
require("mini.trailspace").setup() -- highlight trailing spaces
require("mini.hipatterns").setup({ -- no hex_color: use highlight-colors plugin instead
    highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    },
})
require("mini.cursorword").setup() -- automatically highlight word under cursor
-- UNUSED MINI.VIM MODULES:
-- require("mini.files").setup() -- use yazi plugin instead
-- require("mini.indentscope").setup() -- use indend-blankline plugin instead
-- require("mini.statusline").setup() -- use lualine plugin instead
-- require("mini.tabline").setup() -- use lualine plugin instead
-- require("mini.notify").setup() -- use fidget plugin instead

-- nerd font icons (dependency for lualine)
require("nvim-web-devicons").setup()
-- lualine: status and tabline
require("lualine").setup({
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_x = {'selectioncount', 'searchcount', 'encoding', 'filetype'},
    },
    tabline = {
        lualine_a = { {
            'buffers',
            mode=4,
            icons_enabled=false,
            use_mode_colors=true,
            symbols = { modified=' +' }
        } },
        lualine_z = { {'tabs', use_mode_colors=true} },
    },
})

-- vimtex: latex plugin
-- see ./lua/plugins/vimtex.lua

-- highlight color names/hex/rgb codes in the referenced color
require('nvim-highlight-colors').setup()

-- render-markdown
require('render-markdown').setup({
    heading = {
        -- position = 'inline',
        icons = {'# ', '## ', '### ', '#### ', '##### ', '###### '},
        -- backgrounds = {'CursorColumn', 'CursorColumn', 'CursorColumn', 'CursorColumn', 'CursorColumn', 'CursorColumn'},
        -- foregrounds = {'@comment.error', '@comment.warning', '@comment.todo', '@comment.note', '@markup.heading5', '@markup.heading6'},
    },
    dash = {
        width = 20,
    },
    quote = {
        repeat_linebreak = true,
    },
    win_options = {
        showbreak = {
            default = '',
            rendered = '  ',
        },
        breakindent = {
            default = false,
            rendered = true,
        },
        breakindentopt = {
            default = '',
            rendered = '',
        },
    },
    checkbox = {
        unchecked = { icon = '󰄰 ' },
        checked = { icon = '󰄴 ', scope_highlight = '@markup.strikethrough' },
        custom = {
            question = { raw = '[?]', rendered = ' ', highlight = '@markup.link.label' },
            warning = { raw = '[!]', rendered = ' ', highlight = 'DiagnosticError'},
            important = { raw = '[+]', rendered = ' ', highlight = 'DiagnosticWarn'},
            pro = { raw = '[P]', rendered = '󰔓 ', highlight = '@markup.list.checked'},
            con = { raw = '[C]', rendered = '󰔑 ', highlight = 'DiagnosticError'}
        },
    },
    code = {
        sign = false,
    },
    bullet = {
        icons = {'•︎'},
    },
})

-- fidget (notification window)
-- require("fidget").setup({
--     notification = {
--         override_vim_notify = true,
--     },
--     view = {
--         reflow = true,
--     },
-- })

-- catppuccin setup
require("catppuccin").setup({
    -- transparent_background = true,
    dim_inactive = { enabled = true },
})
-- this must come AFTER config.lazy
vim.cmd.colorscheme("catppuccin-frappe")
-- vim.cmd.colorscheme("catppuccin-macchiato")
--vim.cmd.colorscheme("tokyonight-storm")
--vim.cmd.colorscheme("onenord")

