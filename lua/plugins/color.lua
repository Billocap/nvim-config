return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('tokyonight').setup {
        italic = {
          comments = false,
        },
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    name = 'gruvbox',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('gruvbox').setup {
        italic = {
          comments = false,
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        italic = {
          comments = false,
        },
      }

      vim.cmd 'colorscheme catppuccin'
    end,
  },
}
