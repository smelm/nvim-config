-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Tab through buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', function()
  local buffname = vim.fn.expand '%'

  if buffname == nil or buffname == '' then
    vim.api.nvim_command 'quit'
  else
    local current_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_delete(current_buf, {})
  end
end, { desc = 'Close bother or Quit Vim' })

-- Exit insert mode
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- Insert german characters
vim.api.nvim_set_keymap('i', 'oo', '<c-k>:o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'aa', '<c-k>:a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'uu', '<c-k>:u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'OO', '<c-k>:O', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'AA', '<c-k>:A', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'UU', '<c-k>:U', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'zz', '<c-k>ss', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })

-- Indentation in visual mode
-- Reselect after indentation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- TODO: Other mapping, this overlaps with quit
-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TODO: Map these to the debugging moves
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
