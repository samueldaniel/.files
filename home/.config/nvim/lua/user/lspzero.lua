local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({
  'lua_ls',
  'yamlls',
})

-- (Optional) Configure lua language server for neovim
-- Assumes: brew install lua-language-server
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
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
require('lspconfig').yamlls.setup()
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
