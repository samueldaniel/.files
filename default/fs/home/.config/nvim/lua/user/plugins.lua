-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- an arbitrary change

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- https://github.com/nvim-lua/plenary.nvim
  -- useful lua functions for nvim, a lot of plugins expect this i guess
  "nvim-lua/plenary.nvim",

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- https://github.com/kyazdani42/nvim-web-devicons
  -- icons and colors for a pretty nvim, requires a patched font
  "kyazdani42/nvim-web-devicons",

  -- https://github.com/nvim-telescope/telescope.nvim
  -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  -- use fzf in telescope
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- https://github.com/kyazdani42/nvim-tree.lua
  "kyazdani42/nvim-tree.lua",

  -- https://github.com/romgrk/nvim-treesitter-context
  -- use 'romgrk/nvim-treesitter-context'

  -- https://github.com/neovim/nvim-lspconfig
  -- use 'neovim/nvim-lspconfig'
  
  -- https://github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",

  -- https://github.com/navarasu/onedark.nvim
  "navarasu/onedark.nvim",

  -- https://github.com/tjdevries/colorbuddy.nvim
  -- use 'tjdevries/colorbuddy.nvim'
  -- https://github.com/bbenzikry/snazzybuddy.nvim
  -- use 'bbenzikry/snazzybuddy.nvim'

  -- https://github.com/bkad/CamelCaseMotion
  "bkad/CamelCaseMotion",

  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- https://github.com/tpope/vim-fugitive
  "tpope/vim-fugitive",

  -- https://github.com/lewis6991/gitsigns.nvim
  "lewis6991/gitsigns.nvim",
  -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}

  -- LSP
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"L3MON4D3/LuaSnip"},

  -- old packer installation
  --{
  --  "VonHeikemen/lsp-zero.nvim",
  --  branch = "v2.x",
  --  requires = {
  --    -- LSP Support
  --    {"neovim/nvim-lspconfig"},             -- Required
  --    --Note: if you use NixOS don"t install mason.nvim
  --    --{"williamboman/mason.nvim"},           -- Optional
  --    --{"williamboman/mason-lspconfig.nvim"}, -- Optional

  --    -- Autocompletion
  --    {"hrsh7th/cmp-buffer"},
  --    {"hrsh7th/cmp-path"},
  --    {"L3MON4D3/LuaSnip"},     -- Required
  --    {"saadparwaiz1/cmp_luasnip"},
  --    {"hrsh7th/nvim-cmp"}, -- required
  --    {"hrsh7th/cmp-nvim-lsp"}, -- Required
  --    {"onsails/lspkind.nvim"},
  --  }
  --},

  "LnL7/vim-nix",

  -- https://github.com/ojroques/nvim-osc52
  "ojroques/nvim-osc52",

  "olimorris/onedarkpro.nvim",
})
