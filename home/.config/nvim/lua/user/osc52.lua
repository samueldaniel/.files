require('osc52').setup({
  max_length = 0,      -- Maximum length of selection (0 for no limit)
  silent     = false,  -- Disable message on successful copy
  trim       = false,  -- Trim surrounding whitespaces before copy
})
-- In normal mode, <leader>c is an operator that will copy the given text to the clipboard.
-- vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
-- In normal mode, <leader>cc will copy the current line.
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
-- In visual mode, <leader>c will copy the current selection.
-- vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>cc', '"+yy')
vim.keymap.set('v', '<leader>c', '"+y')

--function copy_register()
--  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
--    require('osc52').copy_register('+')
--  end
--end
--
--vim.api.nvim_create_autocmd('TextYankPost', {callback = copy_register})
