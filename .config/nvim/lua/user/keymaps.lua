local map = vim.keymap.set

map("n", "<C-p>", function()
  require("telescope.builtin").find_files()
end, { desc = "Telescope search files" })

map("n", "<C-e>", ":NvimTreeToggle<cr>", {desc = "NvimTreeToggle"})
-- vim.api.nvim_set_keymap(
--   'n',
--   '<C-e>',
--   ':Telescope file_browser<cr>',
--   { noremap = true }
-- )

-- do not overwrite register on paste
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
-- there are some drawbacks. see link above
vim.cmd('xnoremap p "_dP"')

-- split navigation
vim.cmd('nnoremap <C-J> <C-W><C-J>')
vim.cmd('nnoremap <C-K> <C-W><C-K>')
vim.cmd('nnoremap <C-L> <C-W><C-L>')
vim.cmd('nnoremap <C-H> <C-W><C-H>')
