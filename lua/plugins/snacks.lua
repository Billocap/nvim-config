local invalid_types = {
  'help',
  'lazy',
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
    dashboard = {
      preset = {
        keys = {
          {
            icon = '⌨ ',
            key = '<leader>ch',
            desc = 'Search comamnd',
          },
          {
            icon = '⌨ ',
            key = '<leader>sh',
            desc = 'Search Documentation',
          },
          {
            icon = ' ',
            key = 'f',
            desc = 'Find File',
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = ' ',
            key = 'g',
            desc = 'Find Text',
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = ' ',
            key = 'r',
            desc = 'Recent Files',
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = '󰒲 ',
            key = 'L',
            desc = 'Opens Lazy (plugin manager)',
            action = ':Lazy',
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = ' ',
            key = 'q',
            desc = 'Quit',
            action = ':qa',
          },
        },
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
◇──────────────────Kickstarted───────────────────◇]],
      },
      sections = {
        {
          section = 'header',
          padding = { 4, 0 },
        },
        {
          section = 'keys',
          gap = 1,
          padding = 2,
        },
        {
          gap = 0,
          icon = ' ',
          title = 'Recent Files',
          section = 'recent_files',
          indent = 2,
          padding = 2,
        },
        { section = 'startup' },
      },
    },
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
    lazygit = {},
    statuscolumn = {
      left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
      right = { 'fold', 'git' }, -- priority of signs on the right (high to low)
      folds = {
        git_hl = true, -- use Git Signs hl for fold icons
      },
      refresh = 50, -- refresh at most every 50ms
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
    {
      '<leader>x',
      function()
        if is_invalid(vim.bo.filetype) then
          vim.cmd 'q'
        else
          require('snacks').bufdelete()
        end
      end,
      desc = 'Closes the current buffer',
    },
    {
      '<leader>h',
      function()
        require('snacks').terminal.open()
      end,
      desc = 'Opens a horizontal terminal window',
    },
    {
      '<leader>g',
      function()
        require('snacks').lazygit.open()
      end,
      desc = 'Opens lazygit from inside neo vim',
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = function(evt)
        if evt.file == '' and vim.bo.bt == '' then
          vim.cmd 'only'

          require('snacks').dashboard.open {
            buf = evt.buf,
            win = vim.fn.bufwinid(evt.buf),
          }
        end
      end,
    })
  end,
}
