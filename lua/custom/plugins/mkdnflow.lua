return {
  -- TODO: setup cmp
  {
    'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup {
        modules = {
          bib = false,
          buffers = false,
          conceal = false,
          cursor = true,
          folds = true,
          foldtext = true,
          links = true,
          lists = true,
          maps = false,
          paths = true,
          tables = false,
          yaml = false,
          cmp = false,
        },
        create_dirs = true,
        perspective = {
          priority = 'root',
          fallback = 'current',
          root_tell = 'readme',
          nvim_wd_heel = false,
          update = false,
        },
        wrap = false,
        links = {
          style = 'markdown',
          name_is_source = false,
          conceal = false,
          context = 0,
          implicit_extension = 'md',
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(' ', '_')
            text = text:lower()
            return text
          end,
          create_on_follow_failure = true,
        },
        mappings = {
          -- MkdnUpdateNumbering = { 'n', '<leader>nn' },
        },
      }

      local function setall(keys, command)
        vim.keymap.set({ 'n', 'v' }, keys, '<cmd>' .. command .. '<cr>', { buffer = true })
      end

      local function setnormal(keys, command)
        vim.keymap.set('n', keys, '<cmd>' .. command .. '<cr>', { buffer = true })
      end

      local function alias(keys, command)
        vim.keymap.set('i', keys, command, { buffer = true })
      end

      vim.api.nvim_create_autocmd('BufRead', {
        pattern = { '*.md' },
        callback = function()
          setall('<cr>', 'MkdnEnter')
          setall('<', 'MkdnIncreaseHeading')
          setall('>', 'MkdnDecreaseHeading')

          setall('<leader>mu', 'MkdnCreateLinkFromClipboard')
          setall('<leader>mdl', 'MkdnDestroyLink')
          setall('<leader>mr', 'MkdnMoveSource')

          setall('<leader>myl', 'MkdnYankAnchorLink')
          setall('<leader>m<leader>', 'MkdnToggleToDo')

          setnormal('o', 'MkdnNewListItemBelowInsert')
          setnormal('O', 'MkdnNewListItemAboveInsert')
          setnormal('<leader>mf', 'MkdnFoldSection')
          setnormal('<leader>mF', 'MkdnUnfoldSection')

          alias('SS', '### SZENE: ')
          alias('CC', '### CHARAKTER: ')
          alias('BB', '#### BEAT: ')
          alias('KK', '## KAPITEL: ')
          alias('FF', 'FAKT: ')
          alias('SET', 'SETUP: ')

          -- vim.cmd '<cmd>syntax keyword Type FAKT<cr>'
          -- vim.cmd '<cmd>syntax keyword Type SETUP<cr>'
        end,
      })
    end,
  },
}
