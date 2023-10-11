-- vim.o -> gets or sets general settings
vim.o.background = 'dark'
vim.g.background = 'dark'

-- vim.wo -> gets or sets window-scoped options
vim.wo.colorcolumn = '120'

-- vim.bo -> gets or sets buffer-scoped options
-- vim.bo.filetype = 'lua'

-- vim.g -> gets or sets global variables
-- usually the namespace where you find variables set by plugins
--
-- use space as the leader key
vim.g.mapleader = ' '

-- vim.env -> gets or sets environment variables

-- vim.opt -> get or set global window/buffer settings
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.autowrite = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.cursorline = true

-- Open new split panes to right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- number lines
vim.opt.number = true

-- always display the status line
vim.opt.laststatus = 2

-- always display the tab line
vim.opt.showtabline = 2

-- zt, zb leave 7 lines of space above or below
vim.opt.scrolloff = 7

-- allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"

-- cursor will briefly jump to the matching brace when you insert one
vim.opt.showmatch = true

-- case insensitive searching
-- use \C to force case sensitive
vim.opt.ignorecase = true

-- automatically switch to case sensitive search if you type a capital letter
vim.opt.smartcase = true

-- highlight all search hits
vim.opt.hlsearch = true

-- start searching when you type the first character of the search string. As
-- you type in more characters, the search is refined.
vim.opt.incsearch = true

-- enable using the mouse if the terminal emulator supports it
vim.opt.mouse = "a"

-- remote more commands and search history
vim.opt.history = 1000

-- use many muchos levels of undo
vim.opt.undolevels = 1000

-- don't beep
vim.opt.visualbell = true

-- don't beep really
vim.opt.errorbells = false

-- encoding garbage
vim.opt.encoding = "utf-8"

-- don't show the current mode (`-- INSERT --`) - it is useless with lightline installed
vim.opt.showmode = false

-- set neovim's python provider
vim.g.python3_host_prog = "/home/sam/.pyenv/versions/neovim/bin/python"
vim.g.ruby_host_prog = "/home/sam/.rbenv/versions/3.2.2/bin/ruby"

require('user.plugins') -- always load plugins first
--require('colorbuddy').colorscheme('snazzybuddy')
--vim.g.snazzybuddy_icons = true
require('user.gitsigns')
require('user.onedarkpro')
--require('user.onedark') -- onedark must be loaded before lualine so lualine picks up the theme
require('user.lualine')
require('user.telescope')
require('user.tree')
require('user.lspzero') -- lspzero must be loaded before treesitter
require('user.treesitter')
require('user.osc52')
require('user.keymaps') -- always load keymaps last
