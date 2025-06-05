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
        char = '│',
        underline = true, -- underline the start of the scope
      },
    },
    terminal = {},
  },
}
