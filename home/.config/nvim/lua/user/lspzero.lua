local cmp_action = require('lsp-zero').cmp_action()
local cmp = require('cmp')
cmp.setup({
  -- Make the first item in completion menu always be selected.
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  -- enable "super tab"
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  },

  -- add borders to completion window
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- https://github.com/onsails/lspkind.nvim
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = require('lspkind').cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    })
  },

  sources = {
    -- https://github.com/hrsh7th/cmp-buffer
    {
      name = 'buffer',
      option = {
        -- Options go into this table
        keyword_length = 3,
        keyword_pattern = [[\k\+]], -- use the iskeyword option for recognizing words
        get_bufnrs = function()
          local buf = vim.api.nvim_get_current_buf()
          local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
          if byte_size > 1024 * 1024 then -- 1 Megabyte max
            return {}
          end
          return { buf }
        end,
        -- https://github.com/hrsh7th/cmp-buffer#indexing-and-how-to-optimize-it
        indexing_interval = 100,
        indexing_batch_size = 1000,
        max_indexed_line_length = 1024 * 40,
      },
    },

    -- https://github.com/hrsh7th/cmp-path
    {
      name = 'path',
      option = {
        -- Options go into this table
        trailing_slash = false,
        label_trailing_slash = true,
      },
    },

    -- https://github.com/hrsh7th/cmp-nvim-lsp
    { name = 'nvim_lsp' },
  },
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp = require('lsp-zero').preset({
  -- disables all the features that depends on mason.nvim
  setup_servers_on_start = false,
  call_servers = 'global',

  float_border = 'rounded',
  configure_diagnostics = true,
  set_lsp_keymaps = false,
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = true,
    use_luasnip = true,
    set_format = true,
    documentation_window = false,
  },
})

--[[
Basic mappings

These are the keybindings you get when you enable manage_nvim_cmp.set_basic_mappings.
They are meant to follow Neovim's default whenever possible.

    <Ctrl-y>: Confirms selection.

    <Ctrl-e>: Cancel the completion.

    <Down>: Navigate to the next item on the list.

    <Up>: Navigate to previous item on the list.

    <Ctrl-n>: If the completion menu is visible, go to the next item. Else, trigger completion menu.

    <Ctrl-p>: If the completion menu is visible, go to the previous item. Else, trigger completion menu.

    <Ctrl-d>: Scroll down in the item's documentation.

    <Ctrl-u>: Scroll up in the item's documentation.

Extra mappings

These are the keybindings you get when you enable manage_nvim_cmp.set_extra_mappings.
These enable tab completion and navigation between snippet placeholders.

    <Ctrl-f>: Go to the next placeholder in the snippet.

    <Ctrl-b>: Go to the previous placeholder in the snippet.

    <Tab>: Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.

    <Shift-Tab>: When the completion menu is visible navigate to the previous item in the list.


--]]

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({
  'clangd',
  'jedi_language_server',
  'rnix',
  --'lua_ls',
  'yamlls',
})

-- TBD
-- https://github.com/artempyanykh/marksman
-- https://github.com/lighttiger2505/sqls
-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- https://github.com/valentjn/ltex-ls
-- https://github.com/ansible/ansible-language-server
-- https://github.com/bash-lsp/bash-language-server

require('lspconfig').clangd.setup({ capabilities = capabilities })

-- installed in configuration.nix
require('lspconfig').jedi_language_server.setup({ capabilities = capabilities })

-- https://github.com/nix-community/rnix-lsp
-- installed via configuration.nix
require('lspconfig').rnix.setup({ capabilities = capabilities })

-- https://github.com/luals/lua-language-server
--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--require('lspconfig').lua_ls.setup {
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = {'vim'},
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = vim.api.nvim_get_runtime_file("", true),
--      },
--      -- Do not send telemetry data containing a randomized but unique identifier
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
--}

-- YAML LSP
-- Assumes: brew install yarn 
-- Assumes: yarn global add yaml-language-server
require('lspconfig').yamlls.setup({ capabilities = capabilities })
--
--require('lspconfig').yamlls.setup {
--  ... -- other configuration for setup {}
--  settings = {
--    yaml = {
--      ... -- other settings. note this overrides the lspconfig defaults.
--      schemas = {
--        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
--        ["../path/relative/to/file.yml"] = "/.github/workflows/*"
--        ["/path/from/root/of/project"] = "/.github/workflows/*"
--      },
--    },
--  }
--}


lsp.setup()
