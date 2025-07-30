return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local ng = require 'neogit'
    vim.keymap.set('n', '<leader>g', ng.open, { desc = '[G]it' })
  end,
}
