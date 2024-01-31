local lsp = require('lsp-zero').preset({
  name = 'system-lsp',

  -- disables all the features that depends on mason.nvim
  setup_servers_on_start = true,
  call_servers = 'global',

  float_border = 'rounded',
  configure_diagnostics = true,
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = {},
  },
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true
  },
})
lsp.on_attach(function(client, bufnr)
  --lsp.default_keymaps({
  --  buffer = bufnr,
  --  preserve_mappings = false,
  --})
  lsp.default_keymaps({buffer = bufnr})
end)
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "jedi_language_server",
    "rnix",
    "lua_ls",
    "yamlls",
  },
  handlers = {
    lsp.default_setup,
  }
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
--lsp.setup_servers({
--  'clangd',
--  'jedi_language_server',
--  'rnix',
--  --'lua_ls',
--  'yamlls',
--})

-- TBD
-- https://github.com/artempyanykh/marksman
-- https://github.com/lighttiger2505/sqls
-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- https://github.com/valentjn/ltex-ls
-- https://github.com/ansible/ansible-language-server
-- https://github.com/bash-lsp/bash-language-server

require('lspconfig').clangd.setup({
  capabilities = capabilities,
})

-- installed in configuration.nix
require('lspconfig').jedi_language_server.setup({ capabilities = capabilities })

-- https://github.com/nix-community/rnix-lsp
-- installed via configuration.nix
require('lspconfig').rnix.setup({ capabilities = capabilities })

-- https://github.com/luals/lua-language-server
require('lspconfig').lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
})

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



local cmp_action = lsp.cmp_action()
local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  -- Make the first item in completion menu always be selected.
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  -- enable "super tab"
  mapping = {
    --['<Tab>'] = cmp_action.luasnip_supertab(),
    --['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    --['<Tab>'] = cmp_action.tab_complete(),
    --['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    --['<C-Enter>'] = cmp.mapping.confirm({select = true}),
    --['<C-q>'] = cmp.mapping.complete(),
    --['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
  },

  -- add borders to completion window
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- https://github.com/onsails/lspkind.nvim
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    --format = function(entry, item)
    --  local menu_icon = {
    --    nvim_lsp = 'λ',
    --    luasnip = '⋗',
    --    buffer = 'Ω',
    --    path = '🖫',
    --    nvim_lua = 'Π',
    --  }
    --  item.menu = menu_icon[entry.source.name]
    --  return item
    --end,
    format = require('lspkind').cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    })
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  sources = {

    -- https://github.com/hrsh7th/cmp-nvim-lsp
    { name = 'nvim_lsp' },

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

    {
      name = 'luasnip',
      keyword_length = 2,
    },
  },
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

--[[
K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().

gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().

go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().

gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().

gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().

<F3>: Format code in current buffer. See :help vim.lsp.buf.format().

<F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().

gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().

[d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().

]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().


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
