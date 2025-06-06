return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local disabled_types = {
      '',
      'help',
      'NvimTree',
      'terminal',
      'snacks_terminal',
      'snacks_dashboard',
    }

    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filetype' },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      winbar = {
        lualine_b = {
          {
            'buffers',
            symbols = {
              modified = ' ●', -- Text to show when the buffer is modified
              alternate_file = '', -- Text to show to identify the alternate file
              directory = '', -- Text to show when the buffer is a directory
            },
          },
        },
      },
      inactive_winbar = {
        lualine_c = {
          {
            'filetype',
            colored = false, -- Displays filetype icon in color if set to true
            icon_only = true, -- Display only an icon for filetype
            separator = '',
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            'filename',
            padding = 0,
          },
        },
      },
      options = {
        component_separators = '·',
        section_separators = '┃',
        disabled_filetypes = {
          winbar = disabled_types,
          inactive_winbar = disabled_types,
        },
        globalstatus = true,
      },
    }
  end,
}
