return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  config = function()
    require('origami').setup {
      foldKeymaps = {
        setup = false,
      },
    }

    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
  end,
}
