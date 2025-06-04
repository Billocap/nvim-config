return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = {
            'FIXME',
            'BUG',
            'FIXIT',
            'ISSUE',
          }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = {
          icon = ' ',
          color = 'info',
        },
        HACK = {
          icon = ' ',
          color = 'warning',
        },
        WARN = {
          icon = ' ',
          color = 'warning',
          alt = {
            'WARNING',
            'XXX',
          },
        },
        PERF = {
          icon = ' ',
          alt = {
            'OPTIM',
            'PERFORMANCE',
            'OPTIMIZE',
          },
        },
        NOTE = {
          icon = ' ',
          color = 'hint',
          alt = {
            'INFO',
            'TIP',
          },
        },
        TEST = {
          icon = '⏲ ',
          color = 'test',
          alt = {
            'TESTING',
            'PASSED',
            'FAILED',
          },
        },
      },
    },
    -- Highlight todo, notes, etc in comments
  },

  {
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    'numToStr/Comment.nvim',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
          require('ts_context_commentstring').setup {
            enable_autocmd = false,
          }
        end,
      },
    },
    config = function()
      require('Comment').setup()

      local ft = require 'Comment.ft'

      ft.set('gdscript', '#%s')

      local api = require 'Comment.api'

      vim.keymap.set('n', '<C-_>', api.toggle.linewise.current)

      vim.keymap.set('v', '<C-_>', function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)

        api.toggle.linewise(vim.fn.visualmode())
      end)
    end,
  },
}
