local invalid_types = {
  'help',
  'NvimTree',
}

local function is_invalid(type)
  for _, t in ipairs(invalid_types) do
    if t == type then
      return true
    end
  end

  return false
end

return {
  'echasnovski/mini.nvim',
  dependencies = {
    'folke/ts-comments.nvim',
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

    require('mini.bufremove').setup {
      silent = true,
    }

    vim.keymap.set('n', '<leader>x', function()
      if is_invalid(vim.bo.filetype) then
        vim.cmd 'q'
      else
        require('mini.bufremove').delete()
      end
    end)

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
    require('mini.pairs').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
}
