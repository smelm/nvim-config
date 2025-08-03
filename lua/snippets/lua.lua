local ls = require 'luasnip'

ls.add_snippets('lua', {
  ls.snippet('aucmd', {
    ls.text_node {
      'vim.api.nvim_create_autocmd("BufRead", {',
      '  pattern = { "*.',
    },

    ls.insert_node(1, 'txt'),

    ls.text_node {
      '  ", },',
      '  callback = function()',
      '    ',
    },

    ls.insert_node(0),
    ls.text_node {
      '    ',
      '  end',
      '})',
    },
  }),
})
