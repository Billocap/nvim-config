return {
  config = function()
    -- [[ Basic Autocommands ]]
    --  See `:help lua-guide-autocommands`

    -- Highlight when yanking (copying) text
    --  Try it with `yap` in normal mode
    --  See `:help vim.hl.on_yank()`
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
      callback = function()
        vim.hl.on_yank()
      end,
    })

    -- Automatically resizes windows when vim is resized
    vim.api.nvim_create_autocmd('VimResized', {
      desc = 'Update the size for all open windows',
      group = vim.api.nvim_create_augroup('resize-windows', { clear = true }),
      callback = function()
        vim.cmd 'wincmd ='
      end,
    })
  end,
}
