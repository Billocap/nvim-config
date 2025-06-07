return {
  'echasnovski/mini.nvim',
  dependencies = {
    {
      'folke/ts-comments.nvim',
      opts = {},
      event = 'VeryLazy',
    },
  },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup {
      n_lines = 500,
    }

    -- Quality of life improvements for commenting
    require('mini.comment').setup {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment on current line
        comment_line = '<C-_>',

        -- Toggle comment on visual selection
        comment_visual = '<C-_>',
      },
    }

    -- Highlights the word under the cursor
    require('mini.cursorword').setup()

    -- Move any selection in any direction
    --
    -- Alt + hjkl - To move sections in normal and visual mode
    require('mini.move').setup()

    -- Text edit operators
    --
    -- - g= - Evaluate text and replace with output.
    -- - gx - Exchange text regions.
    -- - gm - Multiply (duplicate) text.
    -- - gr - Replace text with register.
    -- - gs - Sort text.
    require('mini.operators').setup()

    -- Minimal and fast autopairs
    require('mini.pairs').setup {
      modes = {
        insert = true,
        command = true,
        terminal = false,
      },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
}
