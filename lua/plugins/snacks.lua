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
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- Adds a new filetyp 'bigfile' to Neovim that triggers when the file is larger than the configured size.
    -- This automatically prevents things like LSP and Treesitter attaching to the buffer.
    bigfile = {
      notify = true,
    },
    bufdelete = {},
    dashboard = {},
    indent = {
      -- animate scopes. Enabled by default for Neovim >= 0.10
      -- Works on older versions but has to trigger redraws during animation.
      ---@class snacks.indent.animate: snacks.animate.Config
      ---@field enabled? boolean
      --- * out: animate outwards from the cursor
      --- * up: animate upwards from the cursor
      --- * down: animate downwards from the cursor
      --- * up_down: animate up or down based on the cursor position
      ---@field style? "out"|"up_down"|"down"|"up"
      animate = {
        enabled = false,
      },
      ---@class snacks.indent.Scope.Config: snacks.scope.Config
      scope = {
        underline = true, -- underline the start of the scope
        char = '┃',
        hl = 'SnacksIndent',
      },
    },
    terminal = {
      win = {
        style = 'minimal',
        bo = {
          filetype = 'terminal',
        },
      },
    },
  },
  keys = {
    -- {
    --   '<leader>x',
    --   function()
    --     if is_invalid(vim.bo.filetype) then
    --       vim.cmd 'q'
    --     else
    --       require('snacks').bufdelete()
    --     end
    --   end,
    --   desc = 'Closes the current buffer',
    -- },
    {
      '<leader>h',
      function()
        require('snacks').terminal.open()
      end,
      desc = 'Opens a horizontal terminal window',
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    local buf_add = false

    vim.api.nvim_create_autocmd('BufAdd', {
      callback = function(evt)
        if evt.file == '' then
          buf_add = true
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = function(evt)
        if vim.fn.winheight and evt.file == '' and buf_add then
          vim.cmd 'only'

          require('snacks').dashboard.open {
            buf = evt.buf,
            win = vim.fn.bufwinid(evt.buf),
          }

          buf_add = false
        end
      end,
    })
  end,
}
