local map = vim.keymap.set

map("n", "<C-p>", function()
  require("telescope.builtin").find_files()
end, { desc = "Telescope search files" })

--map("n", "<C-b>", function()
--  require("telescope.builtin").buffers()
--end, { desc = "Telescope search buffers" })

map("n", "<C-g>", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })

map("n", "<C-b>", function(opts)
  local action_state = require('telescope.actions.state')
  local actions = require('telescope.actions')
  opts = opts or {}
  opts.attach_mappings = function(prompt_bufnr, map)
    local delete_buf = function()
      local selection = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.api.nvim_buf_delete(selection.bufnr, { force = true })
    end
    map('i', '<c-u>', delete_buf)
    return true
  end
  opts.previewer = true
  opts.layout_config = {
    width = 0.8,
    height = 0.8,
  }
  opts.show_all_buffers = true
  opts.sort_lastused = true
  opts.shorten_path = true
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown(opts))
end, { desc = "show buffers"})

map("n", "<C-e>", ":NvimTreeToggle<cr>", {desc = "NvimTreeToggle"})

-- :bd          - deletes the current buffer, error if there are unwritten changes
-- :bd!         - deletes the current buffer, no error if unwritten changes
-- :bufdo bd    - deletes all buffers, stops at first error (unwritten changes)
-- :bufdo! bd   - deletes all buffers except those with unwritten changes
-- :bufdo! bd!  - deletes all buffers, no error on any unwritten changes
-- 
-- :bw          - completely deletes the current buffer, error if there are unwritten changes
-- :bw!         - completely deletes the current buffer, no error if unwritten changes
-- :bufdo bw    - completely deletes all buffers, stops at first error (unwritten changes)
-- :bufdo! bw   - completely deletes all buffers except those with unwritten changes
-- :bufdo! bw!  - completely deletes all buffers, no error on any unwritten changes
-- 
-- :set confirm - confirm changes (Yes, No, Cancel) instead of error
-- 
-- :ls          - list open buffers
-- :b N         - open buffer number N (as shown in ls)
-- :tabe +Nbuf  - open buffer number N in new tab
-- :bnext       - go to the next buffer (:bn also)
-- :bprevious   - go to the previous buffer (:bp also)
map("n", "<C-w>", ":bd<cr>")
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

-- CamelCaseMotion
vim.cmd('map <silent> w <Plug>CamelCaseMotion_w')
vim.cmd('map <silent> b <Plug>CamelCaseMotion_b')
vim.cmd('map <silent> e <Plug>CamelCaseMotion_e')
vim.cmd('map <silent> ge <Plug>CamelCaseMotion_ge')
vim.cmd('sunmap w')
vim.cmd('sunmap b')
vim.cmd('sunmap e')
vim.cmd('sunmap ge')

vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
