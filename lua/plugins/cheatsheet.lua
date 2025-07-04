return {
  'sudormrfbin/cheatsheet.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('cheatsheet').setup {
      -- Whether to show bundled cheatsheets

      -- For generic cheatsheets like default, unicode, nerd-fonts, etc
      -- bundled_cheatsheets = {
      --     enabled = {},
      --     disabled = {},
      -- },
      bundled_cheatsheets = true,

      -- For plugin specific cheatsheets
      -- bundled_plugin_cheatsheets = {
      --     enabled = {},
      --     disabled = {},
      -- }
      bundled_plugin_cheatsheets = true,

      -- For bundled plugin cheatsheets, do not show a sheet if you
      -- don't have the plugin installed (searches runtimepath for
      -- same directory name)
      include_only_installed_plugins = true,
    }

    vim.keymap.set('n', '<leader>ch', function()
      vim.cmd 'Cheatsheet'
    end, {
      silent = true,
    })
  end,
}
